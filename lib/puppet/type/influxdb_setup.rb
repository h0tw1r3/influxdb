# frozen_string_literal: true

require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'influxdb_setup',
  docs: <<-EOS,
@summary a influxdb type
@example
influxdb {
  ensure => 'present',
}

This type provides the ability to perform initial setup of InfluxDB.  It is implemented as a separate type, as Puppet may be managing all aspects of InfluxDB (repository, installation, setup, etc), or it may be managing resources on an external InfluxDB host.

EOS
  features: [],
  attributes: {
    ensure: {
      type: 'Enum[present, absent]',
      desc: 'Whether this resource should be present or absent on the target system.',
      default: 'present',
    },
    influxdb_host: {
      type: 'String',
      desc: 'The name of the resource you want to manage.',
      behaviour: :namevar,
    },
  },
  autorequire: {
    influxdb: '$influxdb_host',
  }
)