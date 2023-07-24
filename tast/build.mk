#!/bin/bash
set -e
set -x
moonc build-package ../util/util.moon -o ./util/util.lambda -pkg hongbo.com/test_proj/util
moonc build-package ../lib/ident/ident.moon -o ./lib/ident/ident.lambda -pkg hongbo.com/test_proj/lib/ident
moonc build-package ../lib/list/map.moon ../lib/list/rev.moon -o ./lib/list/list.lambda -pkg hongbo.com/test_proj/lib/list -i ./util/util.mi
moonc build-package ../lib/list2/data.moon -o ./lib/list2/list2.lambda -pkg hongbo.com/test_proj/lib/list2 -i ./util/util.mi
moonc build-package ../lib/queue/queue.moon -o ./lib/queue/queue.lambda -pkg hongbo.com/test_proj/lib/queue -i ./lib/list/list.mi
moonc build-package ../main/main.moon -o ./main/main.lambda -pkg main -i ./lib/list/list.mi:L -i ./lib/list2/list2.mi:L2 -i ./lib/queue/queue.mi:Q -i ./lib/ident/ident.mi -i ./util/util.mi
moonc link-tast ./util/util.tast ./lib/ident/ident.tast ./lib/list/list.tast ./lib/list2/list2.tast ./lib/queue/queue.tast ./main/main.tast -o ./main/main.wat
