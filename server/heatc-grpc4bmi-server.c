#include <stdlib.h>

#include "bmi_heat.h"
#include "bmi_grpc_server.h"


int main(int argc, char *argv[])
{
    Bmi *model = (Bmi *) malloc(sizeof(Bmi));

    register_bmi_heat(model);
    run_bmi_server(model, argc, argv);

    free(model);
    return 0;
}
