# frozen_string_literal: true

RSpec.describe FlossFunding::FinalSummary do
  include(ActivationEventsHelper)

  include_context "with stubbed env"

  before do
    # Ensure clean global state for every example
    FlossFunding.namespaces = {}
    # seed the library’s own namespace as activated to avoid noisy output in unrelated places
    stub_env("FLOSS_FUNDING_FLOSS_FUNDING" => "Free-as-in-beer")
  end

  after do
    FlossFunding.namespaces = {}
  end

  # Helper to register a namespace with one or more events
  def register_ns(name, events)
    ns = FlossFunding::Namespace.new(name)
    ns.activation_events = Array(events)
    # add one event to global list (method appends)
    FlossFunding.add_or_update_namespace_with_event(ns, ns.activation_events.first)
    ns
  end

  describe "rendering basics (no namespaces)", :check_output do
    it "prints nothing when there are no namespaces (no spotlight available)" do
      expect(ProgressBar).not_to receive(:create)

      output = capture_stdout { described_class.new }
      expect(output).to eq("")
    end
  end

  describe "rendering with activated and unactivated and invalid", :check_output do
    before do
      # Build three namespaces: A(activated), U(unactivated), I(invalid)
      a1 = make_event("NsA", :activated, library_name: "gem_a")
      u1 = make_event("NsU", :unactivated, library_name: "gem_u")
      i1 = make_event("NsI", :invalid, library_name: "gem_i")

      @ns_a = register_ns("NsA", [a1])
      @ns_u = register_ns("NsU", [u1])
      @ns_i = register_ns("NsI", [i1])

      # Deterministic spotlight: force the random pick to choose a library under @ns_u
      ns_obj = FlossFunding::Namespace.new("NsU")
      cfg = FlossFunding::Configuration.new({"library_name" => ["gem_u"], "floss_funding_url" => ["https://example.invalid/f"], "suggested_donation_amount" => [42]})
      lib_for_spotlight = FlossFunding::Library.new("gem_u", ns_obj, nil, "NsU", __FILE__, nil, nil, ns_obj.env_var_name, cfg, nil)
      allow_any_instance_of(described_class).to receive(:random_unpaid_or_invalid_library).and_return(lib_for_spotlight)

      # Stub configurations to contain default values for each ns
      default_cfg = FlossFunding::Configuration.new({
        "floss_funding_url" => ["https://example.invalid/f"],
        "suggested_donation_amount" => [42],
        "library_name" => ["g"]
      })
      allow(FlossFunding).to receive(:configurations).and_return({
        "NsA" => [default_cfg],
        "NsU" => [default_cfg],
        "NsI" => [default_cfg]
      })

      # Silence the progressbar’s own console output; we only verify it is created and increments
      # Expect the shared progress bar helper to be invoked with activated vs total
      expect(FlossFunding).to receive(:progress_bar).with(1, 3)
    end

    it "prints spotlight for chosen ns and shows counts including invalid" do
      output = capture_stdout { described_class.new }

      # spotlight section for chosen library under NsU
      expect(output).to include("Unactivated/Invalid library spotlight:")
      expect(output).to include("- Library: gem_u")
      expect(output).to include("Namespace: NsU")
      expect(output).to include("ENV Variable: FLOSS_FUNDING_NS_U")
      # configuration-driven values
      expect(output).to include("Suggested donation amount: $42")
      expect(output).to include("Funding URL: https://example.invalid/f")
      # opt-out key format
      expect(output).to include("Opt-out key: \"Not-financially-supporting-NsU\"")

      # summary table
      expect(output).to include("FLOSS Funding Summary:")
      # Headers include all three statuses
      expect(output).to include("activated")
      expect(output).to include("unactivated")
      expect(output).to include("invalid")
      # Rows reflect counts
      expect(output).to match(/\|\s*namespaces\s*\|[^\n]*\b1\b[^\n]*\b1\b[^\n]*\b1\b/)
      expect(output).to match(/\|\s*libraries\s*\|[^\n]*\b1\b[^\n]*\b1\b[^\n]*\b1\b/)
    end
  end

  describe "invalid line suppression (no invalid events)", :check_output do
    it "omits invalid line when there are zero invalid namespaces and libraries" do
      u1 = make_event("OnlyU", :unactivated, library_name: "gem_u")
      register_ns("OnlyU", [u1])

      allow(FlossFunding).to receive(:configurations).and_return({"OnlyU" => [FlossFunding::Configuration.new({})]})

      # Ensure a spotlight is available so the summary prints under the new rules
      ns_obj = FlossFunding::Namespace.new("OnlyU")
      cfg = FlossFunding::Configuration.new({})
      lib_for_spotlight = FlossFunding::Library.new("gem_u", ns_obj, nil, "OnlyU", __FILE__, nil, nil, ns_obj.env_var_name, cfg, nil)
      allow_any_instance_of(described_class).to receive(:random_unpaid_or_invalid_library).and_return(lib_for_spotlight)

      expect(FlossFunding).to receive(:progress_bar).with(0, 1)

      output = capture_stdout { described_class.new }
      expect(output).to include("unactivated")
      expect(output).not_to include("invalid")
      expect(output).to match(/\|\s*namespaces\s*\|[^\n]*\b0\b?[^\n]*\b1\b/)
      expect(output).to match(/\|\s*libraries\s*\|[^\n]*\b0\b?[^\n]*\b1\b/)
    end
  end

  describe "uses defaults when configuration missing or non-hashlike", :check_output do
    it "falls back to default URL and amount and omits empty libraries line" do
      ev = make_event("CfgLess", :unactivated, library_name: nil)
      register_ns("CfgLess", [ev])

      # Return a weird configuration object that causes rescue to [] in details lookup
      allow(FlossFunding).to receive(:configurations).and_return({"CfgLess" => [Object.new]})

      # Deterministic spotlight pick to see details (library-centric spotlight)
      ns_obj = FlossFunding::Namespace.new("CfgLess")
      cfg = FlossFunding::Configuration.new({})
      lib_for_spotlight = FlossFunding::Library.new(nil, ns_obj, nil, "CfgLess", __FILE__, nil, nil, ns_obj.env_var_name, cfg, nil)
      allow_any_instance_of(described_class).to receive(:random_unpaid_or_invalid_library).and_return(lib_for_spotlight)

      expect(FlossFunding).to receive(:progress_bar).with(0, 1)

      output = capture_stdout { described_class.new }
      expect(output).to include("Funding URL: https://floss-funding.dev")
      expect(output).to include("Suggested donation amount: $5")
      # library library_name was nil; libraries list should be omitted
      expect(output).not_to include("Libraries:")
    end
  end

  describe "exception safety" do
    it "swallows unexpected errors during render" do
      # Having something explode, e.g., the progressbar creation
      allow(ProgressBar).to receive(:create).and_raise(StandardError.new("boom"))
      expect { described_class.new }.not_to raise_error
    end
  end

  describe "table and spotlight fallbacks" do
    it "uses the key-value summary when terminal-table raises" do
      summary = described_class.allocate
      summary.instance_variable_set(:@invalid_ns_names, [])
      summary.instance_variable_set(:@invalid_libs, [])
      summary.instance_variable_set(:@detained_ns_names, [])
      summary.instance_variable_set(:@detained_libs, [])
      summary.instance_variable_set(:@activated_ns_names, ["Activated"])
      summary.instance_variable_set(:@unactivated_ns_names, ["Unactivated"])
      summary.instance_variable_set(:@activated_libs, [Object.new])
      summary.instance_variable_set(:@unactivated_libs, [Object.new])
      allow(Terminal::Table).to receive(:new).and_raise(RuntimeError, "no terminal")

      expect(summary.send(:build_summary_table)).to include("namespaces:", "libraries:")
    end

    it "records and renders lockfile debug information for an eligible library" do
      stub_const("FlossFunding::DEBUG", true)
      summary = described_class.allocate
      library = double(library_name: "eligible")
      lock = double(path: "/tmp/at_exit.lock", max_age_seconds: 60)
      allow(lock).to receive(:nagged?).with(library).and_return(false)
      allow(lock).to receive(:record_nag)
      allow(lock).to receive(:key_name_for).with(library).and_return("eligible")
      allow(FlossFunding::Lockfile).to receive(:at_exit).and_return(lock)
      allow(FlossFunding).to receive(:project_root).and_return("/tmp/project")
      summary.instance_variable_set(:@unactivated_libs, [library])
      summary.instance_variable_set(:@invalid_libs, [])
      summary.instance_variable_set(:@detained_libs, [])

      expect(summary.send(:random_unpaid_or_invalid_library)).to eq(library)
      expect(summary.instance_variable_get(:@at_exit_lock_debug_info)).to include(
        "Lockfile: /tmp/at_exit.lock",
        "Window seconds: 60",
        "Chosen: eligible (not previously nagged within window)"
      )
    end

    it "does not select a spotlight when every candidate is already nagged" do
      summary = described_class.allocate
      library = double(library_name: "recent")
      lock = double
      allow(lock).to receive(:nagged?).with(library).and_return(true)
      allow(FlossFunding::Lockfile).to receive(:at_exit).and_return(lock)
      summary.instance_variable_set(:@unactivated_libs, [library])
      summary.instance_variable_set(:@invalid_libs, [])
      summary.instance_variable_set(:@detained_libs, [])

      expect(summary.send(:random_unpaid_or_invalid_library)).to be_nil
    end

    it "returns the original text for an unknown color status" do
      summary = described_class.allocate
      output = StringIO.new
      allow(output).to receive(:tty?).and_return(true)
      allow($stdout).to receive(:tty?).and_return(true)

      expect(summary.send(:apply_color, "plain", :unknown)).to eq("plain")
    end
  end

  # rubocop:disable RSpec/ExpectOutput
  # rubocop:disable RSpec/MultipleExpectations
  describe "colorization and background detection helpers" do
    around do |example|
      rainbow_enabled = Rainbow.enabled
      Rainbow.enabled = true
      example.run
      Rainbow.enabled = rainbow_enabled
    end

    it "returns plain text when not a TTY" do
      # Build an instance (state doesn’t matter here)
      fs = described_class.allocate
      orig_stdout = $stdout
      begin
        sio = StringIO.new # StringIO#tty? returns false
        $stdout = sio
        result = fs.send(:apply_color, "42", FlossFunding::STATES[:activated])
        expect(result).to eq("42")
      ensure
        $stdout = orig_stdout
      end
    end

    it "uses lighter hues on dark backgrounds when TTY" do
      fs = described_class.allocate
      orig_stdout = $stdout
      sio = StringIO.new
      def sio.tty?
        true
      end
      $stdout = sio
      stub_env("COLORFGBG" => "15;0") # background 0 (black) => dark
      out = fs.send(:apply_color, "ok", FlossFunding::STATES[:activated])
      expect(out).to be_a(String)
      expect(out).not_to eq("ok")
      $stdout = orig_stdout
    end

    it "uses darker hues on light backgrounds when TTY" do
      fs = described_class.allocate
      orig_stdout = $stdout
      sio = StringIO.new
      def sio.tty?
        true
      end
      $stdout = sio
      stub_env("COLORFGBG" => "0;15") # background 15 (white) => light
      out = fs.send(:apply_color, "ok", FlossFunding::STATES[:invalid])
      expect(out).to be_a(String)
      expect(out).not_to eq("ok")
      $stdout = orig_stdout
    end

    it "falls back to default colors when background unknown" do
      fs = described_class.allocate
      orig_stdout = $stdout
      sio = StringIO.new
      def sio.tty?
        true
      end
      $stdout = sio
      ENV.delete("COLORFGBG")
      out = fs.send(:apply_color, "ok", FlossFunding::STATES[:unactivated])
      expect(out).to be_a(String)
      expect(out).not_to eq("ok")
      $stdout = orig_stdout
    end
  end
  # rubocop:enable RSpec/ExpectOutput
  # rubocop:enable RSpec/MultipleExpectations

  # Small helper to capture stdout while keeping :check_output opt-in behavior consistent
  def capture_stdout
    old = $stdout
    sio = StringIO.new
    $stdout = sio
    yield
    sio.string
  ensure
    $stdout = old
  end
end
