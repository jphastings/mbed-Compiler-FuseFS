module MbedOnline
  class API
    # Logs the user into the mbed servers
    def initialize(username,password)
    
    end
  
    def list_projects
      ["TestProject"]
    end
    
    def is_project?(project_name)
      project_name == "TestProject"
    end
    
    def is_file?(project_name,file_name)
      is_project?(project_name) and file_name == "main.c"
    end
    
    def list_files(project_name)
      raise Errno::ENOENT "Not a valid Project Name" if not is_project?(project_name)
      ["main.c"]
    end
    
    def file_contents(project_name,file_name)
      raise Errno::ENOENT "Not a valid Project Name" if not is_project?(project_name)
      raise Errno::ENOENT "Not a valid file in this project" if not is_file?(project_name,file_name)
      "void main() { exit(0); }"
    end
  end
end