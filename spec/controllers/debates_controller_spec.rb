require 'rails_helper'

describe DebatesController do

  describe DebatesController do
    let!(:debate){ Debate.create(title: "Fat Tax", body: "A fat body.")}

    context "routing" do
      it "routes / to debates#index" do
        expect(:get => "/").to route_to(controller:"debates", action:"index")
      end
    end

    context "index" do
      it "assigns all debates to a variable" do
        get :index
        expect(assigns(:debates)).to eq Debate.all
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    context "show" do
      before do
        get :show, :id=> debate.id
      end

      it "assigns the debate to a variable" do
        expect(assigns(:debate)).to be
      end

      it "renders the show template" do
        expect(response).to render_template("show")
      end
    end

    context "create" do
      context "with a valid debate" do
        before do
          post :create, :debate=> { :title=> "Ice Cream Tax", :body=> "Triple than it was two years ago."}
        end
        it "creates a new valid debate" do
          expect(Debate.last.title).to eq("Ice Cream Tax")
        end

        it { should respond_with(:redirect) }
        it { should redirect_to(assigns(:debate)) }
      end

      context "an invalid debate" do
        before do
          post :create, :debate=> { :title=> "", :body=> ""}
        end

        it "returns an error" do
          expect(assigns(:debate).errors).not_to be_empty
        end

        it { should render_template('debates/new') }
      end
    end
  end
end
