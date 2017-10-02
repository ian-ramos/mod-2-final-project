require "rails_helper"

RSpec.describe HostsController, :type => :controller do
  let(:first_host) { Host.create(:username => "Bobby Joe")}
  describe "GET index" do
    before { get :index }

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "assigns the @hosts instance variable" do
      expect(assigns(:hosts)).to eq([first_host])
    end
  end

  describe "GET new" do
    before { get :new }

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end

    it "assigns the @host instance variable" do
      expect(assigns(:host)).to be_a_new(Host)
    end
  end

  describe "GET show" do
    before { get :show, params: {id: first_host.id} }

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end

    it "assigns the @host instance variable" do
      expect(assigns(:host)).to eq(first_host)
    end
  end

  describe "GET edit" do
    before { get :edit, params: {id: first_host.id} }

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      expect(response).to render_template("edit")
    end

    it "assigns the @host instance variable" do
      expect(assigns(:host)).to eq(first_host)
    end
  end

end
