; Auto-generated. Do not edit!


(cl:in-package labjack-msg)


;//! \htmlinclude room_stats.msg.html

(cl:defclass <room_stats> (roslisp-msg-protocol:ros-message)
  ((radiant_temp
    :reader radiant_temp
    :initarg :radiant_temp
    :type cl:float
    :initform 0.0)
   (humidity
    :reader humidity
    :initarg :humidity
    :type cl:float
    :initform 0.0)
   (ambient_temp
    :reader ambient_temp
    :initarg :ambient_temp
    :type cl:float
    :initform 0.0)
   (air_velocity0
    :reader air_velocity0
    :initarg :air_velocity0
    :type cl:float
    :initform 0.0)
   (air_velocity1
    :reader air_velocity1
    :initarg :air_velocity1
    :type cl:float
    :initform 0.0)
   (light
    :reader light
    :initarg :light
    :type cl:float
    :initform 0.0)
   (sound
    :reader sound
    :initarg :sound
    :type cl:float
    :initform 0.0))
)

(cl:defclass room_stats (<room_stats>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <room_stats>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'room_stats)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name labjack-msg:<room_stats> is deprecated: use labjack-msg:room_stats instead.")))

(cl:ensure-generic-function 'radiant_temp-val :lambda-list '(m))
(cl:defmethod radiant_temp-val ((m <room_stats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader labjack-msg:radiant_temp-val is deprecated.  Use labjack-msg:radiant_temp instead.")
  (radiant_temp m))

(cl:ensure-generic-function 'humidity-val :lambda-list '(m))
(cl:defmethod humidity-val ((m <room_stats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader labjack-msg:humidity-val is deprecated.  Use labjack-msg:humidity instead.")
  (humidity m))

(cl:ensure-generic-function 'ambient_temp-val :lambda-list '(m))
(cl:defmethod ambient_temp-val ((m <room_stats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader labjack-msg:ambient_temp-val is deprecated.  Use labjack-msg:ambient_temp instead.")
  (ambient_temp m))

(cl:ensure-generic-function 'air_velocity0-val :lambda-list '(m))
(cl:defmethod air_velocity0-val ((m <room_stats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader labjack-msg:air_velocity0-val is deprecated.  Use labjack-msg:air_velocity0 instead.")
  (air_velocity0 m))

(cl:ensure-generic-function 'air_velocity1-val :lambda-list '(m))
(cl:defmethod air_velocity1-val ((m <room_stats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader labjack-msg:air_velocity1-val is deprecated.  Use labjack-msg:air_velocity1 instead.")
  (air_velocity1 m))

(cl:ensure-generic-function 'light-val :lambda-list '(m))
(cl:defmethod light-val ((m <room_stats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader labjack-msg:light-val is deprecated.  Use labjack-msg:light instead.")
  (light m))

(cl:ensure-generic-function 'sound-val :lambda-list '(m))
(cl:defmethod sound-val ((m <room_stats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader labjack-msg:sound-val is deprecated.  Use labjack-msg:sound instead.")
  (sound m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <room_stats>) ostream)
  "Serializes a message object of type '<room_stats>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'radiant_temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'humidity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ambient_temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'air_velocity0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'air_velocity1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'light))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'sound))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <room_stats>) istream)
  "Deserializes a message object of type '<room_stats>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radiant_temp) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'humidity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ambient_temp) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'air_velocity0) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'air_velocity1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'light) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sound) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<room_stats>)))
  "Returns string type for a message object of type '<room_stats>"
  "labjack/room_stats")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'room_stats)))
  "Returns string type for a message object of type 'room_stats"
  "labjack/room_stats")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<room_stats>)))
  "Returns md5sum for a message object of type '<room_stats>"
  "59eedb0be73ea33bd051c9eaec764a62")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'room_stats)))
  "Returns md5sum for a message object of type 'room_stats"
  "59eedb0be73ea33bd051c9eaec764a62")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<room_stats>)))
  "Returns full string definition for message of type '<room_stats>"
  (cl:format cl:nil "float64 radiant_temp~%float64 humidity~%float64 ambient_temp~%float64 air_velocity0~%float64 air_velocity1~%float64 light~%float64 sound~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'room_stats)))
  "Returns full string definition for message of type 'room_stats"
  (cl:format cl:nil "float64 radiant_temp~%float64 humidity~%float64 ambient_temp~%float64 air_velocity0~%float64 air_velocity1~%float64 light~%float64 sound~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <room_stats>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <room_stats>))
  "Converts a ROS message object to a list"
  (cl:list 'room_stats
    (cl:cons ':radiant_temp (radiant_temp msg))
    (cl:cons ':humidity (humidity msg))
    (cl:cons ':ambient_temp (ambient_temp msg))
    (cl:cons ':air_velocity0 (air_velocity0 msg))
    (cl:cons ':air_velocity1 (air_velocity1 msg))
    (cl:cons ':light (light msg))
    (cl:cons ':sound (sound msg))
))
