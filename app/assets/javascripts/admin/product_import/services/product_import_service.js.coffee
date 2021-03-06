angular.module("admin.productImport").factory "ProductImportService", ($rootScope) ->
  new class ProductImportService
    suppliers: {}
    resetTotal: 0
    settings: {}

    updateResetAbsent: (supplierId, resetCount, resetAbsent) ->
      if resetAbsent
        @suppliers[supplierId] = resetCount
        @resetTotal += resetCount
      else
        @suppliers[supplierId] = null
        @resetTotal -= resetCount

      $rootScope.resetTotal = @resetTotal

    updateSettings: (updated) ->
      angular.merge(@settings, updated)

    getSettings: () ->
      @settings