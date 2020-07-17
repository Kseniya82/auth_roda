describe UserRoutes, type: :routes do
  describe 'POST /v1/signup' do
    context 'valid params' do
      let(:params) { { name: 'user', email: 'user@test.com', password: 'password' } }

      it 'returns created status' do
        post '/', params
        expect(last_response.status).to eq(201)
        expect(User.last.email).to eq 'user@test.com'
      end
    end

    context 'invalid params' do
      let(:params) { { name: 'bad_user', email: 'user@test.com', password: '' } }
      
      it 'returns an error' do
        post '/', params
        expect(last_response.status).to eq(422)
        expect(response_body).to be_has_key('errors')
      end
    end
  end
end
