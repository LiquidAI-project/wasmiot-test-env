## About

This repository contains a fully functional test/demo enviroment for running wasm modules with the wasmiot software. This includes the wasmiot orchestrator, 2 supervisors, mongo database and mongo express for exploring it. The source code for orchestrator can be found [here](https://github.com/LiquidAI-project/orchestrator-rust-port), and for supervisor [here](https://github.com/LiquidAI-project/supervisor-rust-port).

## How to use

Don't forget to use the `--recurse-submodules` flag, when cloning the repository.

After cloning the repository, modify the .env file if you want to change some variables to your liking, such as the credentials to mongo express. 

Build the supervisors first by running `./rebuild.sh`

Start the test enviroment by running `./start.sh`

You can access the web interface of the orchestrator from `localhost:4000` by default. The mongo express is accesible in `localhost:4005` by default.

This repository contains a number of precompiled wasm modules in wasm-modules-binary folder, that you can use for testing. These include:
- fibo
- camera
- wasi_mobilenet_inference_onnx
 
Source code for these modules can be found in the [wasmiot modules](https://github.com/LiquidAI-project/wasmiot-modules) repository. The model required  required for the wasi_mobilenet_inference_onnx module can be downloaded from [here](https://github.com/onnx/models/blob/main/validated/vision/classification/mobilenet/model/mobilenetv2-10.onnx). 

If you face issues during usage, some of them can be fixed by recreating the supervisors/orchestrator.

## How it works

TODO

Create a rust project, make it a lib, compile the module to wasm

Explanation on available supervisor interfaces, linking them, and no mangle

Upload modules

Update their definitions

Explanation on deployment/execution/output mounts

Create a deployment

Explanation on steps, any device, orchestartor being their even if it shouldnt be used, limitations of deployments (they are one shot)

Explanation on deploying a deployment (what exactly happens)

Explanation on execution (what exactly happens), some tips (like returning text content might be easiest with output mounts)

## Usage examples

### Fibo
Upload the fibo module through the **modules** tab on the web interface.
- Give a name for it on the "module name" line.
- Upload the fibo module by pressing "upload module", and selecting the file.
- No need to upload metadata card, it is not mandatory
- Press **submit**

A selection opens where you can modify module descriptions. There is no need to modify them now, so just scroll down and press **submit**.

After that, navigate to the **manifests** tab, and there you can create a new manifest. (The words manifest and deployment are used interchangeably, and mean the exact same thing). A deployment consists of 1-n steps, each having a device, module and a function. Device is the device/supervisor the step is executed on. Module is the module selected for that step, and function is the function that is executed from that module on that step. For the fibo example, simply select one of the supervisors on the "device" dropdown, select your fibo module that you named earlier from the "module" dropdown, and then select "fibo" from the "function" dropdown. Then press **submit manifest**. A warning will pop up about failing validation, but there is no need to mind that in this example.

Navigate to the **dashboard** tab, and on the **deploy** section, select the manifest you just created from the dropdown, and press **deploy**.

After that, select the deployment in the **execute** section, input some number into the parameter field (for example 5), and press **execute**. If everything went right, you should get 8 as a result.
### Camera/Mobilenet