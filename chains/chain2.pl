chain(ucdavis_cctv, [
    cctv_driver1,
    feature_extr1,
    lightweight_analytics1,
    alarm_driver1,
    cctv_driver,
    feature_extr,
    lightweight_analytics,
    alarm_driver, 
    wan_optimiser,
    storage,
    video_analytics
   ]).

% service(S, ServiceTime, HW_Reqs, Thing_Reqs, Sec_Reqs)                                                                                                    %AB p()
service(cctv_driver, 2,             1, [ video1 ], or(anti_tampering,access_control)).
service(feature_extr, 5,            3,   [],       and(access_control, or(obfuscated_storage, encrypted_storage))).  %AB HW_Reqs: 2 -> 4.5

service(lightweight_analytics, 10,  5, [],         and(access_control, and(host_IDS, or(obfuscated_storage,encrypted_storage)))).                              %AB HW_Reqs: 2 -> 4.5
service(alarm_driver, 2,            0.5, [ alarm1 ], [access_control, host_IDS]).
service(wan_optimiser, 5,           10,   [],         [pki, firewall, host_IDS]).
service(storage, 10,               50,   [],         [backup, pki]).                                                                 
service(video_analytics, 40,       16,   [],         and(resource_monitoring,or(obfuscated_storage,encrypted_storage))).

service(cctv_driver1, 2,             1, [ video3 ], or(anti_tampering,access_control)).
service(feature_extr1, 5,            3,   [],       and(access_control, or(obfuscated_storage, encrypted_storage))).  %AB HW_Reqs: 2 -> 4.5
service(lightweight_analytics1, 10,  5, [],         and(access_control, and(host_IDS, or(obfuscated_storage,encrypted_storage)))).                              %AB HW_Reqs: 2 -> 4.5
service(alarm_driver1, 2,            0.5, [ alarm1 ], [access_control, host_IDS]).

flow(cctv_driver, feature_extr, 15).                                                                                                                         %AB 20->1
flow(feature_extr, lightweight_analytics, 8).

flow(cctv_driver1, feature_extr1, 15).                                                                                                                         %AB 20->1
flow(feature_extr1, lightweight_analytics1, 8).

flow(lightweight_analytics, alarm_driver, 1).
flow(lightweight_analytics1, alarm_driver1, 1).


flow(feature_extr, wan_optimiser, 15).
flow(feature_extr1, wan_optimiser, 15).


flow(wan_optimiser, storage, 20). 
flow(storage, video_analytics, 20).
   
maxLatency([cctv_driver1, feature_extr1, lightweight_analytics1, alarm_driver1], 150).

