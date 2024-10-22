{
    "annotations": {
      "list": [
        {
          "$$hashKey": "object:1058",
          "builtIn": 1,
          "datasource": {
            "type": "datasource",
            "uid": "grafana"
          },
          "enable": true,
          "hide": true,
          "iconColor": "rgba(0, 211, 255, 1)",
          "name": "Annotations & Alerts",
          "target": {
            "limit": 100,
            "matchAny": false,
            "tags": [],
            "type": "dashboard"
          },
          "type": "dashboard"
        }
      ]
    },
    "editable": true,
    "fiscalYearStartMonth": 0,
    "gnetId": 1860,
    "graphTooltip": 1,
    "id": 1,
    "liveNow": false,
    "panels": [
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 0
        },
        "id": 261,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Quick CPU / Mem / Disk",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Resource pressure via PSI",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 1,
            "links": [],
            "mappings": [],
            "max": 1,
            "min": 0,
            "thresholds": {
              "mode": "percentage",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "dark-yellow",
                  "value": 70
                },
                {
                  "color": "dark-red",
                  "value": 90
                }
              ]
            },
            "unit": "percentunit"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 3,
          "x": 0,
          "y": 1
        },
        "id": 323,
        "options": {
          "displayMode": "basic",
          "maxVizHeight": 300,
          "minVizHeight": 10,
          "minVizWidth": 0,
          "namePlacement": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showUnfilled": true,
          "sizing": "auto",
          "text": {},
          "valueMode": "color"
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "irate(node_pressure_cpu_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "instant": true,
            "intervalFactor": 1,
            "legendFormat": "CPU",
            "range": false,
            "refId": "CPU some",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "irate(node_pressure_memory_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "instant": true,
            "intervalFactor": 1,
            "legendFormat": "Mem",
            "range": false,
            "refId": "Memory some",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "irate(node_pressure_io_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "instant": true,
            "intervalFactor": 1,
            "legendFormat": "I/O",
            "range": false,
            "refId": "I/O some",
            "step": 240
          }
        ],
        "title": "Pressure",
        "type": "bargauge"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Busy state of all CPU cores together",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 1,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "max": 100,
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 85
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 95
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 3,
          "x": 3,
          "y": 1
        },
        "id": 20,
        "options": {
          "minVizHeight": 75,
          "minVizWidth": 75,
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true,
          "sizing": "auto"
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "100 * (1 - avg(rate(node_cpu_seconds_total{mode=\"idle\", instance=\"$node\"}[$__rate_interval])))",
            "hide": false,
            "instant": true,
            "intervalFactor": 1,
            "legendFormat": "",
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "CPU Busy",
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "System load  over all CPU cores together",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 1,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "max": 100,
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 85
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 95
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 3,
          "x": 6,
          "y": 1
        },
        "id": 155,
        "options": {
          "minVizHeight": 75,
          "minVizWidth": 75,
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true,
          "sizing": "auto"
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "scalar(node_load1{instance=\"$node\",job=\"$job\"}) * 100 / count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu))",
            "format": "time_series",
            "hide": false,
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Sys Load",
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Non available RAM memory",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 1,
            "mappings": [],
            "max": 100,
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 80
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 90
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 3,
          "x": 9,
          "y": 1
        },
        "hideTimeOverride": false,
        "id": 16,
        "options": {
          "minVizHeight": 75,
          "minVizWidth": 75,
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true,
          "sizing": "auto"
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "((node_memory_MemTotal_bytes{instance=\"$node\", job=\"$job\"} - node_memory_MemFree_bytes{instance=\"$node\", job=\"$job\"}) / node_memory_MemTotal_bytes{instance=\"$node\", job=\"$job\"}) * 100",
            "format": "time_series",
            "hide": true,
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "(1 - (node_memory_MemAvailable_bytes{instance=\"$node\", job=\"$job\"} / node_memory_MemTotal_bytes{instance=\"$node\", job=\"$job\"})) * 100",
            "format": "time_series",
            "hide": false,
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "B",
            "step": 240
          }
        ],
        "title": "RAM Used",
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Used Swap",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 1,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "max": 100,
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 10
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 25
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 3,
          "x": 12,
          "y": 1
        },
        "id": 21,
        "options": {
          "minVizHeight": 75,
          "minVizWidth": 75,
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true,
          "sizing": "auto"
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "((node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapFree_bytes{instance=\"$node\",job=\"$job\"}) / (node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"})) * 100",
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "SWAP Used",
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Used Root FS",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 1,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "max": 100,
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 80
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 90
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 3,
          "x": 15,
          "y": 1
        },
        "id": 154,
        "options": {
          "minVizHeight": 75,
          "minVizWidth": 75,
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true,
          "sizing": "auto"
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "100 - ((node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"} * 100) / node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"})",
            "format": "time_series",
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Root FS Used",
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Total number of CPU cores",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 2,
          "w": 2,
          "x": 18,
          "y": 1
        },
        "id": 14,
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showPercentChange": false,
          "textMode": "auto",
          "wideLayout": true
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu))",
            "instant": true,
            "legendFormat": "__auto",
            "range": false,
            "refId": "A"
          }
        ],
        "title": "CPU Cores",
        "type": "stat"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "System uptime",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 1,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "s"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 2,
          "w": 4,
          "x": 20,
          "y": 1
        },
        "hideTimeOverride": true,
        "id": 15,
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showPercentChange": false,
          "textMode": "auto",
          "wideLayout": true
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "node_time_seconds{instance=\"$node\",job=\"$job\"} - node_boot_time_seconds{instance=\"$node\",job=\"$job\"}",
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Uptime",
        "type": "stat"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Total RootFS",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 0,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 70
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 90
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 2,
          "w": 2,
          "x": 18,
          "y": 3
        },
        "id": 23,
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showPercentChange": false,
          "textMode": "auto",
          "wideLayout": true
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"}",
            "format": "time_series",
            "hide": false,
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "RootFS Total",
        "type": "stat"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Total RAM",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 0,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 2,
          "w": 2,
          "x": 20,
          "y": 3
        },
        "id": 75,
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showPercentChange": false,
          "textMode": "auto",
          "wideLayout": true
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"}",
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "RAM Total",
        "type": "stat"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Total SWAP",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 0,
            "mappings": [
              {
                "options": {
                  "match": "null",
                  "result": {
                    "text": "N/A"
                  }
                },
                "type": "special"
              }
            ],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 2,
          "w": 2,
          "x": 22,
          "y": 3
        },
        "id": 18,
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showPercentChange": false,
          "textMode": "auto",
          "wideLayout": true
        },
        "pluginVersion": "10.4.2",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"}",
            "instant": true,
            "intervalFactor": 1,
            "range": false,
            "refId": "A",
            "step": 240
          }
        ],
        "title": "SWAP Total",
        "type": "stat"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 5
        },
        "id": 263,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Basic CPU / Mem / Net / Disk",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Basic CPU info",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "smooth",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "percent"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "percentunit"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Busy Iowait"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Idle"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Busy Iowait"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Idle"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Busy System"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Busy User"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Busy Other"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": 0,
          "y": 6
        },
        "id": 77,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true,
            "width": 250
          },
          "tooltip": {
            "mode": "multi",
            "sort": "desc"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "exemplar": false,
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"system\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "hide": false,
            "instant": false,
            "intervalFactor": 1,
            "legendFormat": "Busy System",
            "range": true,
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"user\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Busy User",
            "range": true,
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"iowait\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Busy Iowait",
            "range": true,
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=~\".*irq\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Busy IRQs",
            "range": true,
            "refId": "D",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\",  mode!='idle',mode!='user',mode!='system',mode!='iowait',mode!='irq',mode!='softirq'}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Busy Other",
            "range": true,
            "refId": "E",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"idle\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Idle",
            "range": true,
            "refId": "F",
            "step": 240
          }
        ],
        "title": "CPU Basic",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Basic memory usage",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "SWAP Used"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap Used"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                },
                {
                  "id": "custom.stacking",
                  "value": {
                    "group": false,
                    "mode": "normal"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM Cache + Buffer"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Available"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#DEDAF7",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                },
                {
                  "id": "custom.stacking",
                  "value": {
                    "group": false,
                    "mode": "normal"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": 12,
          "y": 6
        },
        "id": 78,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "RAM Total",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"} - (node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"} + node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"} + node_memory_SReclaimable_bytes{instance=\"$node\",job=\"$job\"})",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "RAM Used",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"} + node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"} + node_memory_SReclaimable_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "RAM Cache + Buffer",
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "RAM Free",
            "refId": "D",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "(node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapFree_bytes{instance=\"$node\",job=\"$job\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "SWAP Used",
            "refId": "E",
            "step": 240
          }
        ],
        "title": "Memory Basic",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Basic network info per interface",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Recv_bytes_eth2"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Recv_bytes_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Recv_drop_eth2"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Recv_drop_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Recv_errs_eth2"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Recv_errs_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CCA300",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Trans_bytes_eth2"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Trans_bytes_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Trans_drop_eth2"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Trans_drop_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Trans_errs_eth2"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Trans_errs_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CCA300",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "recv_bytes_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "recv_drop_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "recv_drop_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#967302",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "recv_errs_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "recv_errs_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "trans_bytes_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "trans_bytes_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "trans_drop_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "trans_drop_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#967302",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "trans_errs_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "trans_errs_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": 0,
          "y": 13
        },
        "id": 74,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "recv {{device}}",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "trans {{device}} ",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Network Traffic Basic",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Disk space used of all filesystems mounted",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "max": 100,
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": 12,
          "y": 13
        },
        "id": 152,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "100 - ((node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'} * 100) / node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}}",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Disk Space Used Basic",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 20
        },
        "id": 265,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "CPU / Memory / Net / Disk",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "percentage",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 70,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "smooth",
              "lineWidth": 2,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "percent"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "percentunit"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Idle - Waiting for something to happen"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Iowait - Waiting for I/O to complete"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Irq - Servicing interrupts"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Nice - Niced processes executing in user mode"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Softirq - Servicing softirqs"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Steal - Time spent in other operating systems when running in a virtualized environment"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCE2DE",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "System - Processes executing in kernel mode"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "User - Normal processes executing in user mode"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#5195CE",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 12,
          "w": 12,
          "x": 0,
          "y": 21
        },
        "id": 3,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 250
          },
          "tooltip": {
            "mode": "multi",
            "sort": "desc"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"system\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "System - Processes executing in kernel mode",
            "range": true,
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"user\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "User - Normal processes executing in user mode",
            "range": true,
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"nice\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Nice - Niced processes executing in user mode",
            "range": true,
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"iowait\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Iowait - Waiting for I/O to complete",
            "range": true,
            "refId": "E",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"irq\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Irq - Servicing interrupts",
            "range": true,
            "refId": "F",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"softirq\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Softirq - Servicing softirqs",
            "range": true,
            "refId": "G",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"steal\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Steal - Time spent in other operating systems when running in a virtualized environment",
            "range": true,
            "refId": "H",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "sum(irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"idle\"}[$__rate_interval])) / scalar(count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)))",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Idle - Waiting for something to happen",
            "range": true,
            "refId": "J",
            "step": 240
          }
        ],
        "title": "CPU",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap - Swap memory usage"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused - Free memory unassigned"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Hardware Corrupted - *./"
              },
              "properties": [
                {
                  "id": "custom.stacking",
                  "value": {
                    "group": false,
                    "mode": "normal"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 12,
          "w": 12,
          "x": 12,
          "y": 21
        },
        "id": 24,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"} - node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"} - node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"} - node_memory_Slab_bytes{instance=\"$node\",job=\"$job\"} - node_memory_PageTables_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapCached_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Apps - Memory used by user-space applications",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_PageTables_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "PageTables - Memory used to map between virtual and physical memory addresses",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_SwapCached_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "SwapCache - Memory that keeps track of pages that have been fetched from swap but not yet been modified",
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Slab_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Slab - Memory used by the kernel to cache data structures for its own use (caches like inode, dentry, etc)",
            "refId": "D",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Cache - Parked file data (file content) cache",
            "refId": "E",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Buffers - Block device (e.g. harddisk) cache",
            "refId": "F",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Unused - Free memory unassigned",
            "refId": "G",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "(node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapFree_bytes{instance=\"$node\",job=\"$job\"})",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Swap - Swap space used",
            "refId": "H",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_HardwareCorrupted_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working",
            "refId": "I",
            "step": 240
          }
        ],
        "title": "Memory Stack",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bits out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "receive_packets_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "receive_packets_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "transmit_packets_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "transmit_packets_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 12,
          "w": 12,
          "x": 0,
          "y": 33
        },
        "id": 84,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Transmit",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Network Traffic",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes read (-) / write (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "Bps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "io time"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*read*./"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byType",
                "options": "time"
              },
              "properties": [
                {
                  "id": "custom.axisPlacement",
                  "value": "hidden"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 12,
          "w": 12,
          "x": 12,
          "y": 33
        },
        "id": 42,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_read_bytes_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Successfully read bytes",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_written_bytes_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Successfully written bytes",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "I/O Usage Read / Write",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "%util",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 40,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "percentunit"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "io time"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byType",
                "options": "time"
              },
              "properties": [
                {
                  "id": "custom.axisPlacement",
                  "value": "hidden"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 12,
          "w": 12,
          "x": 0,
          "y": 45
        },
        "id": 127,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_io_time_seconds_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"} [$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{device}}",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "I/O Utilization",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "IO read (-) / write (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "iops"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Read.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 12,
          "w": 12,
          "x": 12,
          "y": 45
        },
        "id": 229,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_reads_completed_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - Reads completed",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_writes_completed_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Writes completed",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Disk IOps",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 57
        },
        "id": 266,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Memory Meminfo",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 58
        },
        "id": 136,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Inactive_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Inactive - Memory which has been less recently used.  It is more eligible to be reclaimed for other purposes",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Active_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Active - Memory that has been used more recently and usually not reclaimed unless absolutely necessary",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Active / Inactive",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*CommitLimit - *./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 58
        },
        "id": 135,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Committed_AS_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Committed_AS - Amount of memory presently allocated on the system",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_CommitLimit_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "CommitLimit - Amount of  memory currently available to be allocated on the system",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Committed",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 68
        },
        "id": 191,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Inactive_file_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Inactive_file - File-backed memory on inactive LRU list",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Inactive_anon_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Inactive_anon - Anonymous and swap cache on inactive LRU list, including tmpfs (shmem)",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Active_file_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Active_file - File-backed memory on active LRU list",
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Active_anon_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Active_anon - Anonymous and swap cache on active least-recently-used (LRU) list, including tmpfs",
            "refId": "D",
            "step": 240
          }
        ],
        "title": "Memory Active / Inactive Detail",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 68
        },
        "id": 130,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Writeback_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Writeback - Memory which is actively being written back to disk",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_WritebackTmp_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "WritebackTmp - Memory used by FUSE for temporary writeback buffers",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Dirty_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Dirty - Memory which is waiting to get written back to the disk",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "Memory Writeback and Dirty",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages"
              },
              "properties": [
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages"
              },
              "properties": [
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 78
        },
        "id": 138,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Mapped_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Mapped - Used memory in mapped pages files which have been mapped, such as libraries",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Shmem_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Shmem - Used shared memory (shared between several processes, thus including RAM disks)",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_ShmemHugePages_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages",
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_ShmemPmdMapped_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "ShmemPmdMapped - Amount of shared (shmem/tmpfs) memory backed by huge pages",
            "refId": "D",
            "step": 240
          }
        ],
        "title": "Memory Shared and Mapped",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 78
        },
        "id": 131,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_SUnreclaim_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "SUnreclaim - Part of Slab, that cannot be reclaimed on memory pressure",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_SReclaimable_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "SReclaimable - Part of Slab, that might be reclaimed, such as caches",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Slab",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 88
        },
        "id": 70,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_VmallocChunk_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "VmallocChunk - Largest contiguous block of vmalloc area which is free",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_VmallocTotal_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "VmallocTotal - Total size of vmalloc memory area",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_VmallocUsed_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "VmallocUsed - Amount of vmalloc area which is used",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "Memory Vmalloc",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 88
        },
        "id": 159,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Bounce_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Bounce - Memory used for block device bounce buffers",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Memory Bounce",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Inactive *./"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 98
        },
        "id": 129,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_AnonHugePages_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "AnonHugePages - Memory in anonymous huge pages",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_AnonPages_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "AnonPages - Memory in user pages not backed by files",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Anonymous",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 98
        },
        "id": 160,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_KernelStack_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "KernelStack - Kernel memory stack. This is not reclaimable",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Percpu_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "PerCPU - Per CPU memory allocated dynamically by loadable modules",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Kernel / CPU",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "pages",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 108
        },
        "id": 140,
        "options": {
          "legend": {
            "calcs": [
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_HugePages_Free{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "HugePages_Free - Huge pages in the pool that are not yet allocated",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_HugePages_Rsvd{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "HugePages_Rsvd - Huge pages for which a commitment to allocate from the pool has been made, but no allocation has yet been made",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_HugePages_Surp{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "HugePages_Surp - Huge pages in the pool above the value in /proc/sys/vm/nr_hugepages",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "Memory HugePages Counter",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 108
        },
        "id": 71,
        "options": {
          "legend": {
            "calcs": [
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_HugePages_Total{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "HugePages - Total size of the pool of huge pages",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Hugepagesize_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Hugepagesize - Huge Page size",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory HugePages Size",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 118
        },
        "id": 128,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_DirectMap1G_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "DirectMap1G - Amount of pages mapped as this size",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_DirectMap2M_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "DirectMap2M - Amount of pages mapped as this size",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_DirectMap4k_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "DirectMap4K - Amount of pages mapped as this size",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "Memory DirectMap",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 118
        },
        "id": 137,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Unevictable_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Unevictable - Amount of unevictable memory that can't be swapped out for a variety of reasons",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_Mlocked_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "MLocked - Size of pages locked to memory using the mlock() system call",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Unevictable and MLocked",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 128
        },
        "id": 132,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_memory_NFS_Unstable_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "NFS Unstable - Memory in NFS pages sent to the server, but not yet committed to the storage",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Memory NFS",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 138
        },
        "id": 267,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Memory Vmstat",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "pages out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*out/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 139
        },
        "id": 176,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_pgpgin{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Pagesin - Page in operations",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_pgpgout{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Pagesout - Page out operations",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Pages In / Out",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "pages out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*out/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 139
        },
        "id": 22,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_pswpin{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Pswpin - Pages swapped in",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_pswpout{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Pswpout - Pages swapped out",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Memory Pages Swap In / Out",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "faults",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Apps"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#629E51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A437C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#CFFAFF",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "RAM_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#806EB7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#2F575E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Unused"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Pgfault - Page major and minor fault operations"
              },
              "properties": [
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                },
                {
                  "id": "custom.stacking",
                  "value": {
                    "group": false,
                    "mode": "normal"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 149
        },
        "id": 175,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 350
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_pgfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Pgfault - Page major and minor fault operations",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_pgmajfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Pgmajfault - Major page fault operations",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_pgfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])  - irate(node_vmstat_pgmajfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Pgminfault - Minor page fault operations",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "Memory Page Faults",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#99440A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Buffers"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#58140C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6D1F62",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Cached"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Committed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#508642",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Dirty"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Free"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#B7DBAB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Mapped"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "PageTables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Page_Tables"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Slab_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Swap_Cache"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C15C17",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#511749",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total RAM + Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#052B51",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Total Swap"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "VmallocUsed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 149
        },
        "id": 307,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_vmstat_oom_kill{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "oom killer invocations ",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "OOM Killer",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 159
        },
        "id": 293,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "System Timesync",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "seconds",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "s"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Variation*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 160
        },
        "id": 260,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_estimated_error_seconds{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Estimated error in seconds",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_offset_seconds{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Time offset in between local system and reference clock",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_maxerror_seconds{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Maximum error in seconds",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "Time Synchronized Drift",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 160
        },
        "id": 291,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_loop_time_constant{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Phase-locked loop time adjust",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Time PLL Adjust",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Variation*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 170
        },
        "id": 168,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_sync_status{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Is clock synchronized to a reliable server (1 = yes, 0 = no)",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_frequency_adjustment_ratio{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Local clock frequency adjustment",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Time Synchronized Status",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "seconds",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "s"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 170
        },
        "id": 294,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_tick_seconds{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Seconds between clock ticks",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_timex_tai_offset_seconds{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "International Atomic Time (TAI) offset",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Time Misc",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 180
        },
        "id": 312,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "System Processes",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 181
        },
        "id": 62,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_procs_blocked{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Processes blocked waiting for I/O to complete",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_procs_running{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Processes in runnable state",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Processes Status",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Enable with --collector.processes argument on node-exporter",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 181
        },
        "id": 315,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_processes_state{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ state }}",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Processes State",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "forks / sec",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 191
        },
        "id": 148,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_forks_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Processes forks second",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Processes  Forks",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "decbytes"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Max.*/"
              },
              "properties": [
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 191
        },
        "id": 149,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(process_virtual_memory_bytes{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Processes virtual memory size in bytes",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "process_resident_memory_max_bytes{instance=\"$node\",job=\"$job\"}",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Maximum amount of virtual memory available in bytes",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(process_virtual_memory_bytes{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Processes virtual memory size in bytes",
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(process_virtual_memory_max_bytes{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Maximum amount of virtual memory available in bytes",
            "refId": "D",
            "step": 240
          }
        ],
        "title": "Processes Memory",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Enable with --collector.processes argument on node-exporter",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "PIDs limit"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F2495C",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 201
        },
        "id": 313,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_processes_pids{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Number of PIDs",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_processes_max_processes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "PIDs limit",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "PIDs Number and Limit",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "seconds",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "s"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*waiting.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 201
        },
        "id": 305,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_schedstat_running_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "CPU {{ cpu }} - seconds spent running a process",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_schedstat_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "CPU {{ cpu }} - seconds spent by processing waiting for this CPU",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Process schedule stats Running / Waiting",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Enable with --collector.processes argument on node-exporter",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Threads limit"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F2495C",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 211
        },
        "id": 314,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_processes_threads{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Allocated threads",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_processes_max_threads{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Threads limit",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Threads Number and Limit",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 221
        },
        "id": 269,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "System Misc",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 222
        },
        "id": 8,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_context_switches_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Context switches",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_intr_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Interrupts",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Context Switches / Interrupts",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 222
        },
        "id": 7,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_load1{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 4,
            "legendFormat": "Load 1m",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_load5{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 4,
            "legendFormat": "Load 5m",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_load15{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 4,
            "legendFormat": "Load 15m",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "System Load",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 0,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "hertz"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Max"
              },
              "properties": [
                {
                  "id": "custom.lineStyle",
                  "value": {
                    "dash": [
                      10,
                      10
                    ],
                    "fill": "dash"
                  }
                },
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "blue",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 10
                },
                {
                  "id": "custom.hideFrom",
                  "value": {
                    "legend": true,
                    "tooltip": false,
                    "viz": false
                  }
                },
                {
                  "id": "custom.fillBelowTo",
                  "value": "Min"
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Min"
              },
              "properties": [
                {
                  "id": "custom.lineStyle",
                  "value": {
                    "dash": [
                      10,
                      10
                    ],
                    "fill": "dash"
                  }
                },
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "blue",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.hideFrom",
                  "value": {
                    "legend": true,
                    "tooltip": false,
                    "viz": false
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 232
        },
        "id": 321,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "desc"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "node_cpu_scaling_frequency_hertz{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "CPU {{ cpu }}",
            "range": true,
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "avg(node_cpu_scaling_frequency_max_hertz{instance=\"$node\",job=\"$job\"})",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Max",
            "range": true,
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "avg(node_cpu_scaling_frequency_min_hertz{instance=\"$node\",job=\"$job\"})",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Min",
            "range": true,
            "refId": "C",
            "step": 240
          }
        ],
        "title": "CPU Frequency Scaling",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "https://docs.kernel.org/accounting/psi.html",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 10,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "percentunit"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Memory some"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "dark-red",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Memory full"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "light-red",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "I/O some"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "dark-blue",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "I/O full"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "light-blue",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 232
        },
        "id": 322,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "rate(node_pressure_cpu_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "CPU some",
            "range": true,
            "refId": "CPU some",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "rate(node_pressure_memory_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Memory some",
            "range": true,
            "refId": "Memory some",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "rate(node_pressure_memory_stalled_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "Memory full",
            "range": true,
            "refId": "Memory full",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "rate(node_pressure_io_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "I/O some",
            "range": true,
            "refId": "I/O some",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "editorMode": "code",
            "expr": "rate(node_pressure_io_stalled_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "I/O full",
            "range": true,
            "refId": "I/O full",
            "step": 240
          }
        ],
        "title": "Pressure Stall Information",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Enable with --collector.interrupts argument on node-exporter",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Critical*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Max*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 242
        },
        "id": 259,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_interrupts_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ type }} - {{ info }}",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Interrupts Detail",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 242
        },
        "id": 306,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_schedstat_timeslices_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "CPU {{ cpu }}",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Schedule timeslices executed by each cpu",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 252
        },
        "id": 151,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_entropy_available_bits{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Entropy available to random number generators",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Entropy",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "seconds",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "s"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 252
        },
        "id": 308,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(process_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Time spent",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "CPU time spent in user and system contexts",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Max*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 262
        },
        "id": 64,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "process_max_fds{instance=\"$node\",job=\"$job\"}",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Maximum open file descriptors",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "process_open_fds{instance=\"$node\",job=\"$job\"}",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Open file descriptors",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "File Descriptors",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 272
        },
        "id": 304,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Hardware Misc",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "temperature",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "celsius"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Critical*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Max*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 273
        },
        "id": 158,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_hwmon_temp_celsius{instance=\"$node\",job=\"$job\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ chip_name }} {{ sensor }} temp",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_hwmon_temp_crit_alarm_celsius{instance=\"$node\",job=\"$job\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": true,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ chip_name }} {{ sensor }} Critical Alarm",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_hwmon_temp_crit_celsius{instance=\"$node\",job=\"$job\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ chip_name }} {{ sensor }} Critical",
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_hwmon_temp_crit_hyst_celsius{instance=\"$node\",job=\"$job\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": true,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ chip_name }} {{ sensor }} Critical Historical",
            "refId": "D",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_hwmon_temp_max_celsius{instance=\"$node\",job=\"$job\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": true,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ chip_name }} {{ sensor }} Max",
            "refId": "E",
            "step": 240
          }
        ],
        "title": "Hardware temperature monitor",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Max*./"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 273
        },
        "id": 300,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_cooling_device_cur_state{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Current {{ name }} in {{ type }}",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_cooling_device_max_state{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Max {{ name }} in {{ type }}",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Throttle cooling device",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 283
        },
        "id": 302,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_power_supply_online{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ power_supply }} online",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Power supply",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 293
        },
        "id": 296,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Systemd",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 294
        },
        "id": 297,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_systemd_socket_accepted_connections_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ name }} Connections",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Systemd Sockets",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "Failed"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F2495C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Inactive"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FF9830",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Active"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#73BF69",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Deactivating"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FFCB7D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "Activating"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#C8F2C2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 294
        },
        "id": 298,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"activating\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Activating",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"active\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Active",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"deactivating\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Deactivating",
            "refId": "C",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"failed\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Failed",
            "refId": "D",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"inactive\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "Inactive",
            "refId": "E",
            "step": 240
          }
        ],
        "title": "Systemd Units State",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 304
        },
        "id": 270,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Storage Disk",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "The number (after merges) of I/O requests completed per second for the device",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "IO read (-) / write (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "iops"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Read.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 305
        },
        "id": 9,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_reads_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - Reads completed",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_writes_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Writes completed",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Disk IOps Completed",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "The number of bytes read from or written to the device per second",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes read (-) / write (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "Bps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Read.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 305
        },
        "id": 33,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_read_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - Read bytes",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_written_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Written bytes",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Disk R/W Data",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "The average time for requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them.",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "time. read (-) / write (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 30,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "s"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Read.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 315
        },
        "id": 37,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_read_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval]) / irate(node_disk_reads_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "hide": false,
            "interval": "",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - Read wait time avg",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_write_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval]) / irate(node_disk_writes_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "hide": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Write wait time avg",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Disk Average Wait Time",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "The average queue length of the requests that were issued to the device",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "aqu-sz",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 315
        },
        "id": 35,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_io_time_weighted_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "interval": "",
            "intervalFactor": 4,
            "legendFormat": "{{device}}",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Average Queue Size",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "The number of read and write requests merged per second that were queued to the device",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "I/Os",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "iops"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Read.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 325
        },
        "id": 133,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_reads_merged_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Read merged",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_writes_merged_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Write merged",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Disk R/W Merged",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "Percentage of elapsed time during which I/O requests were issued to the device (bandwidth utilization for the device). Device saturation occurs when this value is close to 100% for devices serving requests serially.  But for devices  serving requests in parallel, such as RAID arrays and modern SSDs, this number does not reflect their performance limits.",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "%util",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 30,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "percentunit"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 325
        },
        "id": 36,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_io_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "interval": "",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - IO",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_discard_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "interval": "",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - discard",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Time Spent Doing I/Os",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "The number of outstanding requests at the instant the sample was taken. Incremented as requests are given to appropriate struct request_queue and decremented as they finish.",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "Outstanding req.",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 335
        },
        "id": 34,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_disk_io_now{instance=\"$node\",job=\"$job\"}",
            "interval": "",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - IO now",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Instantaneous Queue Size",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "IOs",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "iops"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EAB839",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#6ED0E0",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EF843C",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#584477",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda2_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BA43A9",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sda3_.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F4D598",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#0A50A1",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#BF1B00",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdb3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0752D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#962D82",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#614D93",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdc3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#9AC48A",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#65C5DB",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9934E",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#EA6460",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde1.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E0F9D7",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sdd2.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#FCEACA",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*sde3.*/"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#F9E2D2",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 335
        },
        "id": 301,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_discards_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "interval": "",
            "intervalFactor": 4,
            "legendFormat": "{{device}} - Discards completed",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_disk_discards_merged_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Discards merged",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Disk IOps Discards completed / merged",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 345
        },
        "id": 271,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Storage Filesystem",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 346
        },
        "id": 43,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}} - Available",
            "metric": "",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filesystem_free_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
            "format": "time_series",
            "hide": true,
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}} - Free",
            "refId": "B",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
            "format": "time_series",
            "hide": true,
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}} - Size",
            "refId": "C",
            "step": 240
          }
        ],
        "title": "Filesystem space available",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "file nodes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 346
        },
        "id": 41,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filesystem_files_free{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}} - Free file nodes",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "File Nodes Free",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "files",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 356
        },
        "id": 28,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filefd_maximum{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 4,
            "legendFormat": "Max open files",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filefd_allocated{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Open files",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "File Descriptor",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "file Nodes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 356
        },
        "id": 219,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filesystem_files{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}} - File nodes total",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "File Nodes Size",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "description": "",
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "normal"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "max": 1,
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "/ ReadOnly"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 366
        },
        "id": 44,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filesystem_readonly{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}} - ReadOnly",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_filesystem_device_error{instance=\"$node\",job=\"$job\",device!~'rootfs',fstype!~'tmpfs'}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{mountpoint}} - Device error",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Filesystem in ReadOnly / Error",
        "type": "timeseries"
      },
      {
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 376
        },
        "id": 272,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Network Traffic",
        "type": "row"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "pps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "receive_packets_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "receive_packets_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "transmit_packets_eth0"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#7EB26D",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byName",
                "options": "transmit_packets_lo"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#E24D42",
                    "mode": "fixed"
                  }
                }
              ]
            },
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 377
        },
        "id": 60,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_packets_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_packets_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Transmit",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Network Traffic by Packets",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "pps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 377
        },
        "id": 142,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_errs_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive errors",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_errs_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Transmit errors",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Network Traffic Errors",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "pps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 387
        },
        "id": 143,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_drop_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive drop",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_drop_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Transmit drop",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Network Traffic Drop",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "pps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 387
        },
        "id": 141,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_compressed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive compressed",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_compressed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Transmit compressed",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Network Traffic Compressed",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "pps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 397
        },
        "id": 146,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_multicast_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive multicast",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Network Traffic Multicast",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "pps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 397
        },
        "id": 144,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_fifo_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive fifo",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_fifo_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Transmit fifo",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Network Traffic Fifo",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets out (-) / in (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "pps"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 407
        },
        "id": 145,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_receive_frame_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "hide": false,
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Receive frame",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Network Traffic Frame",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 407
        },
        "id": 231,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_carrier_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Statistic transmit_carrier",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Network Traffic Carrier",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Trans.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 417
        },
        "id": 232,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_network_transmit_colls_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{device}} - Transmit colls",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Network Traffic Colls",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "entries",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byName",
                "options": "NF conntrack limit"
              },
              "properties": [
                {
                  "id": "color",
                  "value": {
                    "fixedColor": "#890F02",
                    "mode": "fixed"
                  }
                },
                {
                  "id": "custom.fillOpacity",
                  "value": 0
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 417
        },
        "id": 61,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_nf_conntrack_entries{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "NF conntrack entries",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_nf_conntrack_entries_limit{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "NF conntrack limit",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "NF Conntrack",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "Entries",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 427
        },
        "id": 230,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_arp_entries{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{ device }} - ARP entries",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "ARP Entries",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "decimals": 0,
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 427
        },
        "id": 288,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_network_mtu_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{ device }} - Bytes",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "MTU",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "bytes",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "decimals": 0,
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "bytes"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 437
        },
        "id": 280,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_network_speed_bytes{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{ device }} - Speed",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Speed",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packets",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "decimals": 0,
            "links": [],
            "mappings": [],
            "min": 0,
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 437
        },
        "id": 289,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_network_transmit_queue_length{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{ device }} -   Interface transmit queue length",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Queue Length",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "packetes drop (-) / process (+)",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": [
            {
              "matcher": {
                "id": "byRegexp",
                "options": "/.*Dropped.*/"
              },
              "properties": [
                {
                  "id": "custom.transform",
                  "value": "negative-Y"
                }
              ]
            }
          ]
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 447
        },
        "id": 290,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_softnet_processed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "CPU {{cpu}} - Processed",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_softnet_dropped_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "CPU {{cpu}} - Dropped",
            "refId": "B",
            "step": 240
          }
        ],
        "title": "Softnet Packets",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 12,
          "y": 447
        },
        "id": 310,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "irate(node_softnet_times_squeezed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "CPU {{cpu}} - Squeezed",
            "refId": "A",
            "step": 240
          }
        ],
        "title": "Softnet Out of Quota",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisBorderShow": false,
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "counter",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 20,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "insertNulls": false,
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": false,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "links": [],
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 10,
          "w": 12,
          "x": 0,
          "y": 457
        },
        "id": 309,
        "options": {
          "legend": {
            "calcs": [
              "mean",
              "lastNotNull",
              "max",
              "min"
            ],
            "displayMode": "table",
            "placement": "bottom",
            "showLegend": true,
            "width": 300
          },
          "tooltip": {
            "mode": "multi",
            "sort": "none"
          }
        },
        "pluginVersion": "9.2.0",
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_network_up{operstate=\"up\",instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{interface}} - Operational state UP",
            "refId": "A",
            "step": 240
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "expr": "node_network_carrier{instance=\"$node\",job=\"$job\"}",
            "format": "time_series",
            "instant": false,
            "legendFormat": "{{device}} - Physical link state",
            "refId": "B"
          }
        ],
        "title": "Network Operational Status",
        "type": "timeseries"
      },
      {
        "collapsed": true,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 467
        },
        "id": 273,
        "panels": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "counter",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 48
            },
            "id": 63,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true,
                "width": 300
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_TCP_alloc{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "TCP_alloc - Allocated sockets",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_TCP_inuse{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "TCP_inuse - Tcp sockets currently in use",
                "refId": "B",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_TCP_mem{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": true,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "TCP_mem - Used memory for tcp",
                "refId": "C",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_TCP_orphan{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "TCP_orphan - Orphan sockets",
                "refId": "D",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_TCP_tw{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "TCP_tw - Sockets waiting close",
                "refId": "E",
                "step": 240
              }
            ],
            "title": "Sockstat TCP",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "counter",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 48
            },
            "id": 124,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true,
                "width": 300
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_UDPLITE_inuse{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "UDPLITE_inuse - Udplite sockets currently in use",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_UDP_inuse{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "UDP_inuse - Udp sockets currently in use",
                "refId": "B",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_UDP_mem{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "UDP_mem - Used memory for udp",
                "refId": "C",
                "step": 240
              }
            ],
            "title": "Sockstat UDP",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "counter",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 58
            },
            "id": 125,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true,
                "width": 300
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_FRAG_inuse{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "FRAG_inuse - Frag sockets currently in use",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_RAW_inuse{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "RAW_inuse - Raw sockets currently in use",
                "refId": "C",
                "step": 240
              }
            ],
            "title": "Sockstat FRAG / RAW",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "bytes",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 58
            },
            "id": 220,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true,
                "width": 300
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_TCP_mem_bytes{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "mem_bytes - TCP sockets in that state",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_UDP_mem_bytes{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "mem_bytes - UDP sockets in that state",
                "refId": "B",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_FRAG_memory{instance=\"$node\",job=\"$job\"}",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "FRAG_memory - Used memory for frag",
                "refId": "C"
              }
            ],
            "title": "Sockstat Memory Size",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "sockets",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 68
            },
            "id": 126,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true,
                "width": 300
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_sockstat_sockets_used{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "Sockets_used - Sockets currently in use",
                "refId": "A",
                "step": 240
              }
            ],
            "title": "Sockstat Used",
            "type": "timeseries"
          }
        ],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Network Sockstat",
        "type": "row"
      },
      {
        "collapsed": true,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 468
        },
        "id": 274,
        "panels": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "octets out (-) / in (+)",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Out.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 49
            },
            "id": 221,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true,
                "width": 300
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_IpExt_InOctets{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "InOctets - Received octets",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_IpExt_OutOctets{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "OutOctets - Sent octets",
                "refId": "B",
                "step": 240
              }
            ],
            "title": "Netstat IP In / Out Octets",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "datagrams",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 49
            },
            "id": 81,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true,
                "width": 300
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Ip_Forwarding{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "Forwarding - IP forwarding",
                "refId": "A",
                "step": 240
              }
            ],
            "title": "Netstat IP Forwarding",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "messages out (-) / in (+)",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Out.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 59
            },
            "id": 115,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Icmp_InMsgs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "InMsgs -  Messages which the entity received. Note that this counter includes all those counted by icmpInErrors",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Icmp_OutMsgs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "OutMsgs - Messages which this entity attempted to send. Note that this counter includes all those counted by icmpOutErrors",
                "refId": "B",
                "step": 240
              }
            ],
            "title": "ICMP In / Out",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "messages out (-) / in (+)",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Out.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 59
            },
            "id": 50,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Icmp_InErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "InErrors - Messages which the entity received but determined as having ICMP-specific errors (bad ICMP checksums, bad length, etc.)",
                "refId": "A",
                "step": 240
              }
            ],
            "title": "ICMP Errors",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "datagrams out (-) / in (+)",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Out.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Snd.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 69
            },
            "id": 55,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Udp_InDatagrams{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "InDatagrams - Datagrams received",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Udp_OutDatagrams{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "OutDatagrams - Datagrams sent",
                "refId": "B",
                "step": 240
              }
            ],
            "title": "UDP In / Out",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "datagrams",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 69
            },
            "id": 109,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Udp_InErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "InErrors - UDP Datagrams that could not be delivered to an application",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Udp_NoPorts{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "NoPorts - UDP Datagrams received on a port with no listener",
                "refId": "B",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_UdpLite_InErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "interval": "",
                "legendFormat": "InErrors Lite - UDPLite Datagrams that could not be delivered to an application",
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Udp_RcvbufErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "RcvbufErrors - UDP buffer errors received",
                "refId": "D",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Udp_SndbufErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "SndbufErrors - UDP buffer errors send",
                "refId": "E",
                "step": 240
              }
            ],
            "title": "UDP Errors",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "datagrams out (-) / in (+)",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Out.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Snd.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 79
            },
            "id": 299,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Tcp_InSegs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "instant": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "InSegs - Segments received, including those received in error. This count includes segments received on currently established connections",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Tcp_OutSegs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "OutSegs - Segments sent, including those on current connections but excluding those containing only retransmitted octets",
                "refId": "B",
                "step": 240
              }
            ],
            "title": "TCP In / Out",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "description": "",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "counter",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 79
            },
            "id": 104,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_TcpExt_ListenOverflows{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "ListenOverflows - Times the listen queue of a socket overflowed",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_TcpExt_ListenDrops{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "ListenDrops - SYNs to LISTEN sockets ignored",
                "refId": "B",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_TcpExt_TCPSynRetrans{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "TCPSynRetrans - SYN-SYN/ACK retransmits to break down retransmissions in SYN, fast/timeout retransmits",
                "refId": "C",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Tcp_RetransSegs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "interval": "",
                "legendFormat": "RetransSegs - Segments retransmitted - that is, the number of TCP segments transmitted containing one or more previously transmitted octets",
                "refId": "D"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Tcp_InErrs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "interval": "",
                "legendFormat": "InErrs - Segments received in error (e.g., bad TCP checksums)",
                "refId": "E"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Tcp_OutRsts{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "interval": "",
                "legendFormat": "OutRsts - Segments sent with RST flag",
                "refId": "F"
              }
            ],
            "title": "TCP Errors",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "connections",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*MaxConn *./"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "#890F02",
                        "mode": "fixed"
                      }
                    },
                    {
                      "id": "custom.fillOpacity",
                      "value": 0
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 89
            },
            "id": 85,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_netstat_Tcp_CurrEstab{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "CurrEstab - TCP connections for which the current state is either ESTABLISHED or CLOSE- WAIT",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_netstat_Tcp_MaxConn{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "MaxConn - Limit on the total number of TCP connections the entity can support (Dynamic is \"-1\")",
                "refId": "B",
                "step": 240
              }
            ],
            "title": "TCP Connections",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "description": "",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "counter out (-) / in (+)",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*Sent.*/"
                  },
                  "properties": [
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 89
            },
            "id": 91,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_TcpExt_SyncookiesFailed{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "SyncookiesFailed - Invalid SYN cookies received",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_TcpExt_SyncookiesRecv{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "SyncookiesRecv - SYN cookies received",
                "refId": "B",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_TcpExt_SyncookiesSent{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "SyncookiesSent - SYN cookies sent",
                "refId": "C",
                "step": 240
              }
            ],
            "title": "TCP SynCookie",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "connections",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 99
            },
            "id": 82,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Tcp_ActiveOpens{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "ActiveOpens - TCP connections that have made a direct transition to the SYN-SENT state from the CLOSED state",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "irate(node_netstat_Tcp_PassiveOpens{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "PassiveOpens - TCP connections that have made a direct transition to the SYN-RCVD state from the LISTEN state",
                "refId": "B",
                "step": 240
              }
            ],
            "title": "TCP Direct Transition",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "description": "Enable with --collector.tcpstat argument on node-exporter",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "connections",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 99
            },
            "id": 320,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "editorMode": "code",
                "expr": "node_tcp_connection_states{state=\"established\",instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "established - TCP sockets in established state",
                "range": true,
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "editorMode": "code",
                "expr": "node_tcp_connection_states{state=\"fin_wait2\",instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "fin_wait2 - TCP sockets in fin_wait2 state",
                "range": true,
                "refId": "B",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "editorMode": "code",
                "expr": "node_tcp_connection_states{state=\"listen\",instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "listen - TCP sockets in listen state",
                "range": true,
                "refId": "C",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "editorMode": "code",
                "expr": "node_tcp_connection_states{state=\"time_wait\",instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "time_wait - TCP sockets in time_wait state",
                "range": true,
                "refId": "D",
                "step": 240
              }
            ],
            "title": "TCP Stat",
            "type": "timeseries"
          }
        ],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Network Netstat",
        "type": "row"
      },
      {
        "collapsed": true,
        "datasource": {
          "type": "prometheus",
          "uid": "000000001"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 469
        },
        "id": 279,
        "panels": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "description": "",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "seconds",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "normal"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 66
            },
            "id": 40,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_scrape_collector_duration_seconds{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "{{collector}} - Scrape duration",
                "refId": "A",
                "step": 240
              }
            ],
            "title": "Node Exporter Scrape Time",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "description": "",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "counter",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 20,
                  "gradientMode": "none",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 1,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byRegexp",
                    "options": "/.*error.*/"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "#F2495C",
                        "mode": "fixed"
                      }
                    },
                    {
                      "id": "custom.transform",
                      "value": "negative-Y"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 66
            },
            "id": 157,
            "links": [],
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "table",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "9.2.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_scrape_collector_success{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "{{collector}} - Scrape success",
                "refId": "A",
                "step": 240
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "${datasource}"
                },
                "expr": "node_textfile_scrape_error{instance=\"$node\",job=\"$job\"}",
                "format": "time_series",
                "hide": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "{{collector}} - Scrape textfile error (1 = true)",
                "refId": "B",
                "step": 240
              }
            ],
            "title": "Node Exporter Scrape",
            "type": "timeseries"
          }
        ],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "000000001"
            },
            "refId": "A"
          }
        ],
        "title": "Node Exporter",
        "type": "row"
      }
    ],
    "refresh": "1m",
    "revision": 1,
    "schemaVersion": 39,
    "tags": [
      "linux"
    ],
    "templating": {
      "list": [
        {
          "current": {
            "selected": false,
            "text": "default",
            "value": "default"
          },
          "hide": 0,
          "includeAll": false,
          "label": "Datasource",
          "multi": false,
          "name": "datasource",
          "options": [],
          "query": "prometheus",
          "queryValue": "",
          "refresh": 1,
          "regex": "",
          "skipUrlSync": false,
          "type": "datasource"
        },
        {
          "current": {
            "selected": false,
            "text": "node-exporter",
            "value": "node-exporter"
          },
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "definition": "",
          "hide": 0,
          "includeAll": false,
          "label": "Job",
          "multi": false,
          "name": "job",
          "options": [],
          "query": {
            "query": "label_values(node_uname_info, job)",
            "refId": "Prometheus-job-Variable-Query"
          },
          "refresh": 1,
          "regex": "",
          "skipUrlSync": false,
          "sort": 1,
          "tagValuesQuery": "",
          "tagsQuery": "",
          "type": "query",
          "useTags": false
        },
        {
          "current": {
            "selected": false,
            "text": "node-exporter:9100",
            "value": "node-exporter:9100"
          },
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "definition": "label_values(node_uname_info{job=\"$job\"}, instance)",
          "hide": 0,
          "includeAll": false,
          "label": "Host",
          "multi": false,
          "name": "node",
          "options": [],
          "query": {
            "query": "label_values(node_uname_info{job=\"$job\"}, instance)",
            "refId": "Prometheus-node-Variable-Query"
          },
          "refresh": 1,
          "regex": "",
          "skipUrlSync": false,
          "sort": 1,
          "tagValuesQuery": "",
          "tagsQuery": "",
          "type": "query",
          "useTags": false
        },
        {
          "current": {
            "selected": false,
            "text": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+",
            "value": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+"
          },
          "hide": 2,
          "includeAll": false,
          "multi": false,
          "name": "diskdevices",
          "options": [
            {
              "selected": true,
              "text": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+",
              "value": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+"
            }
          ],
          "query": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+",
          "skipUrlSync": false,
          "type": "custom"
        }
      ]
    },
    "time": {
      "from": "now-24h",
      "to": "now"
    },
    "timepicker": {
      "refresh_intervals": [
        "5s",
        "10s",
        "30s",
        "1m",
        "5m",
        "15m",
        "30m",
        "1h",
        "2h",
        "1d"
      ],
      "time_options": [
        "5m",
        "15m",
        "1h",
        "6h",
        "12h",
        "24h",
        "2d",
        "7d",
        "30d"
      ]
    },
    "timezone": "browser",
    "title": "Host-Full-Dashboard",
    "uid": "sajosam",
    "version": 2,
    "weekStart": ""
  }