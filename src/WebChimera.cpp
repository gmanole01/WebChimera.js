
#include <node.h>

#include "JsVlcPlayer.h"
#include "NodeTools.h"

#undef NODE_MODULE_VERSION
#define NODE_MODULE_VERSION 107

NODE_MODULE_INIT(/* exports, module, context */) {
    JsVlcPlayer::initJsApi(exports, module, context);
}
