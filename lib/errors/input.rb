module Input
  class ArgumentError < StandardError
  end
  #used to crash the application
  class Exit < StandardError
  end
  #used to keep the begin end loop running
  class Retry < StandardError
  end
end
