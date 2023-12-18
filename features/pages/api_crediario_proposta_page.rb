class APICrediarioProposta
    include HTTParty
    @@uri = "http://api.viamais-qa.ocp-eqx.dc.nova/vv-crediario/propostas"
    base_uri @@uri
    format :json

    def initialize
        autenticacao = APIAutoriza.new
        @token = autenticacao.postToken

        @headers = {
            Authorization: "Bearer #{@token["access_token"]}",
            "accept": '*/*',
            "Content-Type": 'application/json'
        }
    end

    #Métedos
    def get(codigo, digito)
        @response = self.class.get("/#{codigo}/#{digito}/status", :headers => @headers)

        self.logResponse
        @response
    end

    def logRequest(method)
        puts '========================================'
        puts '>>>>>>>>>>>>>   REQUEST    <<<<<<<<<<<<<'
        puts '----------------------------------------'
        puts '    URL: ' + @@uri.to_s
        puts '    Method: ' + method.to_s
        puts '    Headers: ' + @headers.to_s
        if @body != nil
            puts '    Body: ' + @body.to_s
        end
        puts '----------------------------------------'
    end

    def logResponse
        puts '========================================'
        puts '>>>>>>>>>>>>>   RESPONSE   <<<<<<<<<<<<<'
        puts '----------------------------------------'
        puts '    Code: ' + @response.code.to_s
        puts '    Body: ' + @response.body.to_s
        puts '----------------------------------------'
    end
end