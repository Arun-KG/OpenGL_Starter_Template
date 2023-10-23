workspace "OpenGL_starter_template"
	architecture "x64"

	configurations {
		"Debug",
		"Release"
	}

	startproject "OpenGL_Editor"

outDir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Project_name"
	location "OpenGL_Editor"
	kind "ConsoleApp"
	language "C++"

	targetdir ("build/" .. outDir .. "/%{prj.name}")
	objdir ("build-obj/" .. outDir .. "/%{prj.name}")

	files { 
		-- Source code
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/src/**.c",

		--ImGui
		"%{prj.name}/dependencies/ImGui/**.h",
		"%{prj.name}/dependencies/ImGui/**.cpp"
	}

	ignoredefaultlibraries { 
		"msvcrt.lib"
	}

	includedirs {
		--GLAD
		"%{wks.location}/Dependencies/GLAD/include",

		--GLFW
		"%{wks.location}/Dependencies/GLFW/include",

		--ImGui
		"%{prj.name}/dependencies/ImGui",
	}

	libdirs {
		"%{wks.location}/Dependencies/GLFW/lib"
	}

	links {
		"glfw3.lib",
		"opengl32.lib"
	}


	filter "system:windows"
		cppdialect "C++20"
		staticruntime "off"
		systemversion "latest"

	filter "configurations:Debug"
		defines {
			"_DEBUG",
			"_CONSOLE"
		}
		symbols "On"
	

	filter "configurations:Release"
		defines {
			"NDEBUG",
			"_CONSOLE"
		}
		optimize "On"