param autoScaleName string
param location string
param enabledTrue bool
param appServicePlanId string
param profileName string
param minCapacity string
param maxCapacity string
param defaultCapacity string
param metricName string
param timeGrain string
param statistic string
param timeWindow string
param triggerOperator string
param triggerThreshold int
param direction string
param triggerOperatorDown string
param triggerThresholdDown int
param directionDown string
param type string
param value string
param nameSpace string


resource autoScale 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: autoScaleName
  location: location
  properties: {
    enabled: enabledTrue
    targetResourceUri: appServicePlanId
    profiles: [
      {
        name: profileName
        capacity: {
          minimum: minCapacity
          maximum: maxCapacity
          default: defaultCapacity
        }
        rules: [
          {
            metricTrigger: {
              metricName: metricName
              metricNamespace: nameSpace
              metricResourceUri: appServicePlanId
              timeGrain: timeGrain
              statistic: statistic
              timeWindow: timeWindow
              timeAggregation: statistic
              operator: triggerOperator
              threshold: triggerThreshold
            }
            scaleAction: {
              direction: direction
              type: type
              value: value
              cooldown: timeWindow
            }
          }
          {
            metricTrigger: {
              metricName: metricName
              metricNamespace: nameSpace
              metricResourceUri: appServicePlanId
              timeGrain: timeGrain
              statistic: statistic
              timeWindow: timeWindow
              timeAggregation: statistic
              operator: triggerOperatorDown
              threshold: triggerThresholdDown
            }
            scaleAction: {
              direction: directionDown
              type: type
              value: value
              cooldown: timeWindow
            }
          }
        ]
      }
    ]
  }
}
