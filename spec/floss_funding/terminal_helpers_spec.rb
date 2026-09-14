# frozen_string_literal: true

# rubocop:disable RSpec/MultipleExpectations, RSpec/VerifiedDoubles, RSpec/MessageSpies

RSpec.describe FlossFunding::Terminal do
  include_context "with stubbed env"

  # Focus on apply_width! behavior and avoid brittle environment coupling for columns

  describe "::apply_width!" do
    it "applies width to a table when columns detected" do
      table = double("table")
      allow(described_class).to receive(:columns).and_return(77)
      expect(table).to receive(:style=).with({width: 77})
      expect(described_class.apply_width!(table)).to eq(table)
    end

    it "returns table unchanged when errors occur" do
      table = double("table")
      allow(described_class).to receive(:columns).and_raise(StandardError)
      expect(described_class.apply_width!(table)).to eq(table)
    end
  end

  describe "::columns" do
    # Terminal.columns invokes Kernel#` as a private method. Stubbing its Object
    # receiver is the only deterministic way to exercise fallback sources.
    # rubocop:disable RSpec/AnyInstance
    it "falls back to COLUMNS when tput cannot report a width" do
      stub_env("COLUMNS" => "123")
      allow_any_instance_of(Object).to receive(:`).with("tput cols 2>/dev/null").and_return("")

      expect(described_class.columns).to eq(123)
    end

    it "ignores an invalid COLUMNS value" do
      stub_env("COLUMNS" => "not-a-width")
      allow_any_instance_of(Object).to receive(:`).with("tput cols 2>/dev/null").and_return("")

      expect(described_class.columns).to be_nil
    end

    it "uses IO.console when stdout is a TTY and earlier sources are unavailable" do
      stub_env("COLUMNS" => nil)
      allow_any_instance_of(Object).to receive(:`).with("tput cols 2>/dev/null").and_return("")
      output = StringIO.new
      allow(output).to receive(:tty?).and_return(true)
      allow($stdout).to receive(:tty?).and_return(true)
      allow(IO).to receive(:console).and_return(double(winsize: [24, 101]))

      expect(described_class.columns).to eq(101)
    end
    # rubocop:enable RSpec/AnyInstance
  end
end
# rubocop:enable RSpec/MultipleExpectations, RSpec/VerifiedDoubles, RSpec/MessageSpies
