module BaseCrm

  module Resource

    def pass_headers(klass)
      token_name = BaseCrm.config.token_name
      token = self.original_scope.headers[token_name]
      klass.headers({ token_name => token })
    end

  end

end

