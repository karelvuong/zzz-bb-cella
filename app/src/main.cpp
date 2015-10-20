#include <bb/cascades/Application>

#include "app.hpp"

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    Application app(argc, argv);
    App mainApp;

    // Start the application event loop (run-loop).
    return Application::exec();
}
