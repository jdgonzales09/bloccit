require 'rails_helper'
include RandomData

RSpec.describe Api::V1::CommentsController, type: :controller do
    let(:my_user) { create(:user) }
    let(:my_topic) { create(:topic) }
    let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }
    let(:my_comment) { Comment.create!(body: 'Comment Body', post: my_post, user: my_user) }

    context "unauthenticated user" do
        it "GET index returns http success" do
            get :index, topic_id: my_topic.id, post_id: my_post.id, id: my_comment.id
            expect(response).to have_http_status(:success)
        end

        it "GET show returns http success" do
            get :show, topic_id: my_topic.id, post_id: my_post.id, id: my_comment.id
            expect(response).to have_http_status(:success)
        end
    end

    context "unauthorized user" do
        before do
            controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
        end

        it "GET index returns http success" do
            get :index, topic_id: my_topic.id, post_id: my_post.id, id: my_comment.id
            expect(response).to have_http_status(:success)
        end

        it "GET show returns http success" do
            get :show, topic_id: my_topic.id, post_id: my_post.id, id: my_comment.id
            expect(response).to have_http_status(:success)
        end
    end
end
