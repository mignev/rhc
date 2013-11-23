module RHC
  module VERSION #:nocov:
    STRING = Gem.loaded_specs['app'].version.to_s rescue '0.0.0'
  end
end
