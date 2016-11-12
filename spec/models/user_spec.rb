require 'spec_helper'

describe User do
  let(:subject) {create(:user)}

  #Respond to relationship has one profile
  it { expect(subject).to respond_to :notes }

  #Respond to attributes
  context "attrs" do
    it { expect(subject).to respond_to :email }
    it { expect(subject).to respond_to :firstname }
    it { expect(subject).to respond_to :lastname }
  end

  context "validations" do
    it "validates user not valid" do
      subject.email = nil
      expect(subject).not_to be_valid

      subject.password = ''
      expect(subject).not_to be_valid
    end

    it "validates user not valid without firstname" do
      subject.firstname = ""
      expect(subject).not_to be_valid
    end

    it "validates user not valid without lastname" do
      subject.lastname = ""
      expect(subject).not_to be_valid
    end

    it "should be valid" do
      expect(subject).to be_valid
    end
  end

end
