allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Fix: flutter_compass (0.7.x–0.8.x) doesn't declare namespace (required by AGP 8+)
// Use plugins.withId to hook during configuration, not afterEvaluate.
subprojects {
    plugins.withId("com.android.library") {
        if (name == "flutter_compass") {
            configure<com.android.build.gradle.LibraryExtension> {
                namespace = "com.hemanthraj.fluttercompass"
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
