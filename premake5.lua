project "fmt"
	kind "StaticLib"
	language "C++"
	cppdialect "C++11"
    staticruntime "off"

	targetdir ("bin/" .. outputDir .. "/")
	objdir ("bin/intermediate/" .. outputDir .. "/")

	files {
		"src/format.cc",
		"src/os.cc",
		"include/fmt/*.h",
	}

    includedirs {
        "include"
    }

	filter "system:windows"
		systemversion "latest"
        defines {
            "_CRT_SECURE_NO_WARNINGS"
        }

	filter "system:linux"
		pic "On"
		systemversion "latest"

    filter "toolset:clang"
        buildoptions {
            "-Wall",
            "-Wextra",
            "-pedantic",
            "-Wconversion",
            "-Wundef",
            "-Wdeprecated",
            "-Wweak-vtables",
            "-Wshadow",
            "-Wno-gnu-zero-variadic-macro-arguments"
        }
   
    filter "toolset:gcc"
        buildoptions {
            "-Wall",
            "-Wextra",
            "-pedantic",
            "-Wconversion",
            "-Wundef",
            "-Wshadow",
            "-pedantic-errors",
            "-Wold-style-cast",
            "-Wredundant-decls",
            "-Wwrite-strings",
            "-Wpointer-arith",
            "-Wcast-qual",
            "-Wformat=2",
            "-Wmissing-include-dirs",
            "-Wcast-align",
            "-Wctor-dtor-privacy",
            "-Wdisabled-optimization",
            "-Winvalid-pch",
            "-Woverloaded-virtual",
            "-Wno-ctor-dtor-privacy",
            "-Wno-format-nonliteral",
            "-Wno-dangling-else",
            "-Wno-unused-local-typedefs",
            "-Wdouble-promotion",
            "-Wtrampolines",
            "-Wzero-as-null-pointer-constant",
            "-Wuseless-cast",
            "-Wvector-operation-performance",
            "-Wsized-deallocation",
            "-Wshift-overflow=2",
            "-Wnull-dereference",
            "-Wduplicated-cond",
        }

    filter "toolset:msc*"
        buildoptions {
            "/W3",
        }

    filter "configurations:Logging"
        runtime "Debug"
        symbols "on"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
        symbols "off"
