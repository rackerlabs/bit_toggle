require 'spec_helper'

describe BitToggle do
  after do
    $redis.del set
  end

  before do
    $redis.del set
  end

  let(:feature) { :new_hotness }
  let(:object)  { double("object", to_s: "to_s")}
  let(:set)     { BitToggle.feature_key(feature) }

  describe ".disable" do
    before do
      BitToggle.enable(feature, object)
    end

    it "disables the feature for the device" do
      BitToggle.disable(feature, object)
      expect(BitToggle.enabled?(feature, object)).to be_false
    end
  end

  describe ".enable" do
    it "enables the feature for the device" do
      BitToggle.enable(feature, object)
      expect(BitToggle.enabled?(feature, object)).to be_true
    end
  end

  describe ".enable_globally" do
    it "enables the feature globally" do
      BitToggle.enable_globally(feature)
      expect(BitToggle.enabled?(feature, :global)).to be_true
    end
  end

  describe ".enabled?" do
    context "with a feature enabled" do
      before do
        BitToggle.enable(feature, object)
      end

      it "returns true" do
        expect(BitToggle.enabled?(feature, object)).to be_true
      end
    end

    context "with a feature enabled globally" do
      before do
        BitToggle.enable(feature, :global)
      end

      it "returns true" do
        expect(BitToggle.enabled?(feature, object)).to be_true
      end
    end

    context "without a feature enabled" do
      it "returns false" do
        expect(BitToggle.enabled?(feature, object)).to be_false
      end
    end
  end

  describe ".disabled?" do
    it "returns the inverse of .enabled?" do
      expect(!BitToggle.enabled?(feature, object)).
        to eq(BitToggle.disabled?(feature, object))
    end
  end

  describe ".feature_key" do
    it "returns the key for the feature" do
      expect(BitToggle.feature_key(feature)).to eq("features:#{feature.to_s}")
    end
  end

  describe ".object_key" do
    it "returns the key for the object" do
      expect(BitToggle.object_key(object)).to eq("#{object.class.name}:#{object.to_s}")
    end
  end

  describe ".remove" do
    it "removes the feature completely" do
      BitToggle.remove(feature)
      expect($redis.exists(set)).to be_false
    end
  end
end
