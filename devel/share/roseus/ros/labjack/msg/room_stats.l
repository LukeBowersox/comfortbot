;; Auto-generated. Do not edit!


(when (boundp 'labjack::room_stats)
  (if (not (find-package "LABJACK"))
    (make-package "LABJACK"))
  (shadow 'room_stats (find-package "LABJACK")))
(unless (find-package "LABJACK::ROOM_STATS")
  (make-package "LABJACK::ROOM_STATS"))

(in-package "ROS")
;;//! \htmlinclude room_stats.msg.html


(defclass labjack::room_stats
  :super ros::object
  :slots (_radiant_temp _humidity _ambient_temp _air_velocity0 _air_velocity1 _light _sound ))

(defmethod labjack::room_stats
  (:init
   (&key
    ((:radiant_temp __radiant_temp) 0.0)
    ((:humidity __humidity) 0.0)
    ((:ambient_temp __ambient_temp) 0.0)
    ((:air_velocity0 __air_velocity0) 0.0)
    ((:air_velocity1 __air_velocity1) 0.0)
    ((:light __light) 0.0)
    ((:sound __sound) 0.0)
    )
   (send-super :init)
   (setq _radiant_temp (float __radiant_temp))
   (setq _humidity (float __humidity))
   (setq _ambient_temp (float __ambient_temp))
   (setq _air_velocity0 (float __air_velocity0))
   (setq _air_velocity1 (float __air_velocity1))
   (setq _light (float __light))
   (setq _sound (float __sound))
   self)
  (:radiant_temp
   (&optional __radiant_temp)
   (if __radiant_temp (setq _radiant_temp __radiant_temp)) _radiant_temp)
  (:humidity
   (&optional __humidity)
   (if __humidity (setq _humidity __humidity)) _humidity)
  (:ambient_temp
   (&optional __ambient_temp)
   (if __ambient_temp (setq _ambient_temp __ambient_temp)) _ambient_temp)
  (:air_velocity0
   (&optional __air_velocity0)
   (if __air_velocity0 (setq _air_velocity0 __air_velocity0)) _air_velocity0)
  (:air_velocity1
   (&optional __air_velocity1)
   (if __air_velocity1 (setq _air_velocity1 __air_velocity1)) _air_velocity1)
  (:light
   (&optional __light)
   (if __light (setq _light __light)) _light)
  (:sound
   (&optional __sound)
   (if __sound (setq _sound __sound)) _sound)
  (:serialization-length
   ()
   (+
    ;; float64 _radiant_temp
    8
    ;; float64 _humidity
    8
    ;; float64 _ambient_temp
    8
    ;; float64 _air_velocity0
    8
    ;; float64 _air_velocity1
    8
    ;; float64 _light
    8
    ;; float64 _sound
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _radiant_temp
       (sys::poke _radiant_temp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _humidity
       (sys::poke _humidity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ambient_temp
       (sys::poke _ambient_temp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _air_velocity0
       (sys::poke _air_velocity0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _air_velocity1
       (sys::poke _air_velocity1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _light
       (sys::poke _light (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sound
       (sys::poke _sound (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _radiant_temp
     (setq _radiant_temp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _humidity
     (setq _humidity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ambient_temp
     (setq _ambient_temp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _air_velocity0
     (setq _air_velocity0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _air_velocity1
     (setq _air_velocity1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _light
     (setq _light (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sound
     (setq _sound (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get labjack::room_stats :md5sum-) "59eedb0be73ea33bd051c9eaec764a62")
(setf (get labjack::room_stats :datatype-) "labjack/room_stats")
(setf (get labjack::room_stats :definition-)
      "float64 radiant_temp
float64 humidity
float64 ambient_temp
float64 air_velocity0
float64 air_velocity1
float64 light
float64 sound

")



(provide :labjack/room_stats "59eedb0be73ea33bd051c9eaec764a62")


