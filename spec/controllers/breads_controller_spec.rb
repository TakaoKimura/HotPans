require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BreadsController do
=begin
  # This should return the minimal set of attributes required to create a valid
  # Bread. As you add validations to Bread, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BreadsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all breads as @breads" do
      bread = Bread.create! valid_attributes
      get :index, {}, valid_session
      assigns(:breads).should eq([bread])
    end
  end

  describe "GET show" do
    it "assigns the requested bread as @bread" do
      bread = Bread.create! valid_attributes
      get :show, {:id => bread.to_param}, valid_session
      assigns(:bread).should eq(bread)
    end
  end

  describe "GET new" do
    it "assigns a new bread as @bread" do
      get :new, {}, valid_session
      assigns(:bread).should be_a_new(Bread)
    end
  end

  describe "GET edit" do
    it "assigns the requested bread as @bread" do
      bread = Bread.create! valid_attributes
      get :edit, {:id => bread.to_param}, valid_session
      assigns(:bread).should eq(bread)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bread" do
        expect {
          post :create, {:bread => valid_attributes}, valid_session
        }.to change(Bread, :count).by(1)
      end

      it "assigns a newly created bread as @bread" do
        post :create, {:bread => valid_attributes}, valid_session
        assigns(:bread).should be_a(Bread)
        assigns(:bread).should be_persisted
      end

      it "redirects to the created bread" do
        post :create, {:bread => valid_attributes}, valid_session
        response.should redirect_to(Bread.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bread as @bread" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bread.any_instance.stub(:save).and_return(false)
        post :create, {:bread => { "name" => "invalid value" }}, valid_session
        assigns(:bread).should be_a_new(Bread)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bread.any_instance.stub(:save).and_return(false)
        post :create, {:bread => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bread" do
        bread = Bread.create! valid_attributes
        # Assuming there are no other breads in the database, this
        # specifies that the Bread created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Bread.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => bread.to_param, :bread => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested bread as @bread" do
        bread = Bread.create! valid_attributes
        put :update, {:id => bread.to_param, :bread => valid_attributes}, valid_session
        assigns(:bread).should eq(bread)
      end

      it "redirects to the bread" do
        bread = Bread.create! valid_attributes
        put :update, {:id => bread.to_param, :bread => valid_attributes}, valid_session
        response.should redirect_to(bread)
      end
    end

    describe "with invalid params" do
      it "assigns the bread as @bread" do
        bread = Bread.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bread.any_instance.stub(:save).and_return(false)
        put :update, {:id => bread.to_param, :bread => { "name" => "invalid value" }}, valid_session
        assigns(:bread).should eq(bread)
      end

      it "re-renders the 'edit' template" do
        bread = Bread.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bread.any_instance.stub(:save).and_return(false)
        put :update, {:id => bread.to_param, :bread => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bread" do
      bread = Bread.create! valid_attributes
      expect {
        delete :destroy, {:id => bread.to_param}, valid_session
      }.to change(Bread, :count).by(-1)
    end

    it "redirects to the breads list" do
      bread = Bread.create! valid_attributes
      delete :destroy, {:id => bread.to_param}, valid_session
      response.should redirect_to(breads_url)
    end
  end
=end
end
