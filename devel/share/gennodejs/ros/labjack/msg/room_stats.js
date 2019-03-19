// Auto-generated. Do not edit!

// (in-package labjack.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class room_stats {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.radiant_temp = null;
      this.humidity = null;
      this.ambient_temp = null;
      this.air_velocity0 = null;
      this.air_velocity1 = null;
      this.light = null;
      this.sound = null;
    }
    else {
      if (initObj.hasOwnProperty('radiant_temp')) {
        this.radiant_temp = initObj.radiant_temp
      }
      else {
        this.radiant_temp = 0.0;
      }
      if (initObj.hasOwnProperty('humidity')) {
        this.humidity = initObj.humidity
      }
      else {
        this.humidity = 0.0;
      }
      if (initObj.hasOwnProperty('ambient_temp')) {
        this.ambient_temp = initObj.ambient_temp
      }
      else {
        this.ambient_temp = 0.0;
      }
      if (initObj.hasOwnProperty('air_velocity0')) {
        this.air_velocity0 = initObj.air_velocity0
      }
      else {
        this.air_velocity0 = 0.0;
      }
      if (initObj.hasOwnProperty('air_velocity1')) {
        this.air_velocity1 = initObj.air_velocity1
      }
      else {
        this.air_velocity1 = 0.0;
      }
      if (initObj.hasOwnProperty('light')) {
        this.light = initObj.light
      }
      else {
        this.light = 0.0;
      }
      if (initObj.hasOwnProperty('sound')) {
        this.sound = initObj.sound
      }
      else {
        this.sound = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type room_stats
    // Serialize message field [radiant_temp]
    bufferOffset = _serializer.float64(obj.radiant_temp, buffer, bufferOffset);
    // Serialize message field [humidity]
    bufferOffset = _serializer.float64(obj.humidity, buffer, bufferOffset);
    // Serialize message field [ambient_temp]
    bufferOffset = _serializer.float64(obj.ambient_temp, buffer, bufferOffset);
    // Serialize message field [air_velocity0]
    bufferOffset = _serializer.float64(obj.air_velocity0, buffer, bufferOffset);
    // Serialize message field [air_velocity1]
    bufferOffset = _serializer.float64(obj.air_velocity1, buffer, bufferOffset);
    // Serialize message field [light]
    bufferOffset = _serializer.float64(obj.light, buffer, bufferOffset);
    // Serialize message field [sound]
    bufferOffset = _serializer.float64(obj.sound, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type room_stats
    let len;
    let data = new room_stats(null);
    // Deserialize message field [radiant_temp]
    data.radiant_temp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [humidity]
    data.humidity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ambient_temp]
    data.ambient_temp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [air_velocity0]
    data.air_velocity0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [air_velocity1]
    data.air_velocity1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [light]
    data.light = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sound]
    data.sound = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'labjack/room_stats';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '59eedb0be73ea33bd051c9eaec764a62';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 radiant_temp
    float64 humidity
    float64 ambient_temp
    float64 air_velocity0
    float64 air_velocity1
    float64 light
    float64 sound
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new room_stats(null);
    if (msg.radiant_temp !== undefined) {
      resolved.radiant_temp = msg.radiant_temp;
    }
    else {
      resolved.radiant_temp = 0.0
    }

    if (msg.humidity !== undefined) {
      resolved.humidity = msg.humidity;
    }
    else {
      resolved.humidity = 0.0
    }

    if (msg.ambient_temp !== undefined) {
      resolved.ambient_temp = msg.ambient_temp;
    }
    else {
      resolved.ambient_temp = 0.0
    }

    if (msg.air_velocity0 !== undefined) {
      resolved.air_velocity0 = msg.air_velocity0;
    }
    else {
      resolved.air_velocity0 = 0.0
    }

    if (msg.air_velocity1 !== undefined) {
      resolved.air_velocity1 = msg.air_velocity1;
    }
    else {
      resolved.air_velocity1 = 0.0
    }

    if (msg.light !== undefined) {
      resolved.light = msg.light;
    }
    else {
      resolved.light = 0.0
    }

    if (msg.sound !== undefined) {
      resolved.sound = msg.sound;
    }
    else {
      resolved.sound = 0.0
    }

    return resolved;
    }
};

module.exports = room_stats;
