class APIAutoriza
    include HTTParty
    base_uri "http://api.viamais-qa.ocp-eqx.dc.nova/uaa/oauth"
    format :json

    def initialize
        @body = {
            "empresaFuncionario" => CONFIG['empresa'],
            "empresaFilial" => CONFIG['empresa'],
            "filial" => CONFIG['filial'],
            "bandeira" => "1",
            "username" => CONFIG['matricula'],
            "password" => CONFIG['senha'],
            "scope" => "webclient",
            "grant_type" => "password",
            "canalVenda" => "ViaMais"
        }

        @headers = {
            Authorization: 'Basic Y2xpZW50YXBwOnBhc3N3b3Jk',
            Cookie: '407b318b7c8f52aaf623c250a7698aad=9e0d85231c9672a80a23faa1501b74d4',
            Host: 'api.viamais-qa.ocp-eqx.dc.nova',
            Accept: '*/*',
            "Content-Length": '1080',
            "Content-Type": 'application/x-www-form-urlencoded'
        }      
    end

    def postToken
        self.class.post("/token", :body => @body, :headers => @headers)
    end
end