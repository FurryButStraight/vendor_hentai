# Copyright (C) 2020 The ConquerOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FURRY_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PROD_VERSION).zip
MD5 := prebuilts/build-tools/path/$(HOST_OS)-x86/md5sum

.PHONY: furry
furry: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(FURRY_TARGET_PACKAGE)
	$(hide) $(MD5) $(FURRY_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FURRY_TARGET_PACKAGE).md5sum
	@echo "Done"
	@echo -e "\t ===============================-Package complete-============================================================="
	@echo -e "\t Zip: $(FURRY_TARGET_PACKAGE)"
	@echo -e "\t MD5: `cat $(FURRY_TARGET_PACKAGE).md5sum | awk '{print $$1}' `"
	@echo -e "\t Size: `du -sh $(FURRY_TARGET_PACKAGE) | awk '{print $$1}' `"
	@echo -e "\t hentaiOS - Furry But Straight by The Buxxed Realm"
	@echo -e "\t =============================================================================================================="
