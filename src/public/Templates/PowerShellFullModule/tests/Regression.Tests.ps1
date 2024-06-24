Describe "Regression tests" -Tag Build {

    BeforeAll {
        Unload-SUT
        Import-Module ($global:SUTPath)
    }

    after all {
        Unload-SUT
    }

    Context "Github Issues" {

    }
}