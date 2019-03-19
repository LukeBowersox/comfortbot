
(cl:in-package :asdf)

(defsystem "labjack-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "room_stats" :depends-on ("_package_room_stats"))
    (:file "_package_room_stats" :depends-on ("_package"))
  ))