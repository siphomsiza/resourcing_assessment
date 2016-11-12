require 'spec_helper'

RSpec.describe Note do
  let(:subject) {create(:note)}

  #Respond to relationship has one profile
  it { expect(subject).to respond_to :user }

  #Respond to attributes
  context "attrs" do
    it { expect(subject).to respond_to :title }
    it { expect(subject).to respond_to :content }
    it { expect(subject).to respond_to :color }
    it { expect(subject).to respond_to :private }
    it { expect(subject).to respond_to :pos_x }
    it { expect(subject).to respond_to :pos_y }
    it { expect(subject).to respond_to :z_index }
  end

  describe "Methods" do
    describe "#as_json" do
      context "when invoking with no params" do
        let(:json){ subject.to_json }
        it "should return a json with just id, title ,private and content" do
          expect(json).to eql(subject.to_json(:only => [:id,:user_id,:content,:color,:title,:private ,:pos_x, :pos_y, :z_index,:created_at,:updated_at]) )
        end
      end

      context "when invoking with options" do
        let(:json){ subject.to_json(:only => [:id, :content]) }
        it "should call to super with that options" do
          expect(json).to eql(%({"id":#{subject.id},"content":"#{subject.content}"}))
        end
      end
    end
  end

  context "validations" do
    it "validates user not valid" do
      subject.user = nil
      expect(subject).not_to be_valid

      subject.title = ''
      expect(subject).not_to be_valid
    end
  end
end
