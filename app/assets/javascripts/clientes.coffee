# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
clienteCenter = angular.module('clienteCenter', [ 'ngResource' ])
clienteCenter.factory 'Api', [
  '$resource'
  ($resource) ->
    {
      Cliente: $resource '/verifica_cpf', {},
        index:
          method: 'GET'
          isArray: true
          responseType: 'json'
        update:
          method: 'PUT'
          responseType: 'json'
    }
]
clienteCenter.controller 'ClientesController', [
  '$scope'
  'Api'
  ($scope, Api) ->

    $scope.verifica_success = ->
      if $scope.cliente.length > 0
        showHref = $('#showCliente').attr('href')
        $('#showCliente').attr 'href', showHref +  $scope.cliente[0].id
        editHref = $('#editCliente').attr('href')
        $('#editCliente').attr 'href', editHref + $scope.cliente[0].id + "/edit"

        $('#MyModal').modal()

      return
    $scope.verifica_fail = ->
      # Growlyflash.error("Ocorreu um erro ao tentar verifica a propota. Por favor, tente novamente mais tarde.")
      return
    $scope.verifica = () ->
      $scope.cliente = Api.Cliente.index({cpf: $scope.cpf},$scope.cpf,$scope.verifica_success,$scope.verifica_fail)
    return
]
