require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end
      
      context "with valid attributes" do
        it "adds a micropost" do
          micropost_params = attributes_for(:micropost)
          log_in @user
          expect { post :create, params: { micropost: micropost_params }}.to change(@user.microposts, :count).by(1)
        end
      end
      
      context "with invalid attributes" do
        it "does not add a micropost" do
          micropost_params = attributes_for(:micropost, :invalid)
          log_in @user
          expect { post :create, params: { micropost: micropost_params }}.to_not change(@user.microposts, :count)
        end
      end
    end
    
    context "as a guest" do
      it "returns a 302 responde" do
        micropost_params = attributes_for(:micropost)
        post :create, params: { micropost: micropost_params }
        expect(response).to have_http_status "302"
      end
      
      it "redirects to the login page" do
        micropost_params = attributes_for(:micropost)
        post :create, params: { micropost: micropost_params }
        expect(response).to redirect_to login_url
      end
    end
  end
  
  describe "#destroy" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
        @micropost = create(:micropost, user: @user)
      end
      
      it "deletes a micropost" do
        log_in @user
        expect { delete :destroy, params: { id: @micropost.id }}.to change(@user.microposts, :count).by(-1)
      end
    end
    
    context "as an unauthorized user" do
      before do
        @user = create(:user)
        other_user = create(:user)
        @micropost = create(:micropost, user: other_user)
      end
      
      it "does not delete the micropost" do
        log_in @user
        expect { delete :destroy, params: { id: @micropost.id }}.to_not change(Micropost, :count)
      end 
      
      it "redirects to the dashboard" do
        log_in @user
        delete :destroy, params: { id: @micropost.id }
        expect(response).to redirect_to root_path
      end
      
      context "as a guest" do
        before do
          @micropost = create(:micropost)
        end
        
        it "returns a 302 response" do
          delete :destroy, params: { id: @micropost.id }
          expect(response).to have_http_status "302"
        end
        
        it "redirects to the login page" do
          delete :destroy, params: { id: @micropost.id }
          expect(response).to redirect_to login_url
        end
        
        it "does not delete the micropost" do
          expect { delete :destroy, params: { id: @micropost.id }}.to_not change(Micropost, :count)
        end
      end
    end
  end
end
