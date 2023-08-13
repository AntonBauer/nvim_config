
local function is_web(line)
  return vim.fn.match('<Project Sdk="Microsoft.NET.Sdk.Web">', line) ~= -1
end

local function is_exe(line)
  return vim.fn.match('<OutputType>Exe</OutputType>', line) ~= -1
end

local function is_test(line)
  return vim.fn.match('<IsTestProject>true</IsTestProject>', line) ~= -1
end

local function is_runnable_project(project_path)
  local content = vim.fn.readfile(project_path)

  for l = 1, #content do
    local line = content[l]

    if is_web(line) or is_exe(line) then
      return true;
    end
  end

  return false;
end

local function find_corresponding_dlls(runnable_projects_paths)

end

local function filter_runnable_projects(project_files_paths)
  local runnable_projects = {}
  local runnable_proj_index = 1

  for i = 1, #project_files_paths do
    local project_file_path = project_files_paths[i]

    if is_runnable_project(project_file_path) then
      runnable_projects[runnable_proj_index] = project_file_path
      runnable_proj_index = runnable_proj_index + 1;
    end
  end

  return runnable_projects
end

function find_runnable_dlls(root_dir)
  local project_file_paths = vim.fn.globpath(root_dir .. '/**', '*.csproj')
  local runnable_project_paths = filter_runnable_projects(project_file_paths)

  return find_corresponding_dlls(runnable_project_paths);
end



