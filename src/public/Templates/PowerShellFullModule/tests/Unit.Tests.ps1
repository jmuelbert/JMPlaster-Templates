Describe "Basic function unit tests" -Tags Build {
    BeforeAll {
        Unload-SUT
        Import-Module ($global:SUTPath)
    }

    after all {
        Unload-SUT
    }
}
