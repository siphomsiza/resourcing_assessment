
shared_examples("REST API controller") do
  #cleaner code
  subject(:instance)   {subject.class.name.underscore.to_sym}
  subject(:collection) {subject.class.name.underscore.pluralize.to_sym}
  subject(:assigned)   {assigns(instance)}
  let(:error_message)  {"Couldn't find #{subject.class.name} with id=invalid"}

  #generate models for each test
  subject {@subject}

  before(:each) do
    request.accept = "application/json"
    @object_title_method ||="name"
  end

  describe "GET index" do
    it "returns a list (200)" do
      get :index, @params
      expect(response.status).to eq(200)
      expect(Note.all.to_a).to eq(@index.to_a)
    end
  end

  describe "GET show" do
    it "finds a record (200)" do
      get :show, @params.merge(:id => subject.id)
      expect(response.status).to eq(200)
      #expect(assigned).to be_persisted
    end

    it "contains the correct record" do
      get :show, @params.merge(:id => subject.id)
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "persists a new record (201)" do
      post :create, @params.merge(instance => @built_subject.attributes.merge(@extra_item_params||{}))
      expect(response.status).to eq(201)
      # expect(assigned).to be_persisted
    end

    it "does not persist an invalid record (422)" do
      post :create, @params.merge(instance => @invalid_subject.attributes)
      expect(response.status).to eq(422)
      #expect(assigned).not_to be_persisted
    end
  end

  describe "PUT update" do
    it "persists updated record (200)" do
      put :update, @params.merge(instance => subject.attributes.merge(@extra_item_params||{}), :id => subject.id)
      expect(response.status).to eq(200)
      # expect(assigned).to be_persisted
    end

    it "returns an updated record" do
      updated_at = subject.updated_at
      put :update, @params.merge(instance => subject.attributes.merge!({"title" => "update"}), :id => subject.id)
      expect(assigned.send(:updated_at)).to be > updated_at
    end

    it "does not update a record with invalid data (422)" do
      put :update, @params.merge(instance => @attributes, :id => subject.id)
      expect(response.status).to eq(422)
      expect(subject.class.name.constantize.find(subject.id)).to be_valid
    end
  end

  describe "PUT destroy" do
    it "removes a record (204)" do
      put :destroy, @params.merge("_method" => :delete, :id => subject.id)
      expect(response.status).to eq(204)
      # expect(assigned).not_to be_persisted
    end
  end
end
