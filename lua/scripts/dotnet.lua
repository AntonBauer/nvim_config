local dotnet = {}

local is_web = function(line)
  return vim.fn.match('<Project Sdk="Microsoft.NET.Sdk.Web">', line) ~= -1
end

local is_exe = function(line)
  return vim.fn.match('<OutputType>Exe</OutputType>', line) ~= -1
end

local is_test = function(line)
  return vim.fn.match('<IsTestProject>true</IsTestProject>', line) ~= -1
end

-- Check if specified project is runnable
-- aka is .exe or web app
local is_runnable_project = function(project_path)
  local content = vim.fn.readfile(project_path)

  for _, line in ipairs(content) do
    if is_web(line) or is_exe(line) then
      return true;
    end
  end

  return false;
end

-- For specified project files find corresponding dlls
local find_dlls_for_projects = function (runnable_projects_paths)
  local corresponding_dlls = {}

  for _, project_path in ipairs(runnable_projects_paths) do
    local folder = vim.fn.fnamemodify(project_path, ':p:h')
    local file_name = vim.fn.fnamemodify(project_path, ':t:r')

    local dll_filename = vim.fn.split(vim.fn.globpath(folder .. '/**/', file_name .. '.dll'), '\n')[1]
    table.insert(corresponding_dlls, dll_filename)
  end

  print(vim.inspect(corresponding_dlls))
  return corresponding_dlls
end

-- From project files filter only "runnable" projects
-- .exe, web apps
local filter_runnable_projects = function(project_files_paths)
  local runnable_projects = {}

  for _, project_file_path in ipairs(project_files_paths) do
    if is_runnable_project(project_file_path) then
      table.insert(runnable_projects, project_file_path)
    end
  end

  print(vim.inspect(runnable_projects))
  return runnable_projects
end

-- Search for all runnable csproj in specified directory
dotnet.find_runnable_dlls = function(root_dir)
  local project_file_paths = vim.fn.split(vim.fn.globpath(root_dir .. '/**', '*.csproj'), '\n')
  local runnable_project_paths = filter_runnable_projects(project_file_paths)

  return find_dlls_for_projects(runnable_project_paths);
end

return dotnet
