(ns w3m.core
  (:require child_process
            [clojure.string :refer [split]]
            [clojure.pprint :refer [pprint pp]]))

;; const { exec } = require('child_process');
(defonce exec (.-exec child_process))
;; exec('cat *.js bad_file | wc -l', (err, stdout, stderr) => {
;;                                                             if (err) {
;;                                                                       // node couldn't execute the command
;;                                                                       return;
;;                                                                       }

;;                                                             // the *entire* stdout and stderr (buffered)
;;                                                             console.log(`stdout: ${stdout}`);
;;                                                             console.log(`stderr: ${stderr}`);
;;                                                             });

;; (if (empty? *command-line-args*)
;;   (println "please provide a gallery URL as the argument")
;;   (println "ok " exec))
;; (exec "ls -la" (fn [e sout serr]
;;                  (println sout #_(split sout #"\n" ))))
;; list-directory
;; (exec "w3m google.com", (fn [err stdout stderr]
;;                           (println (take 10 stdout))))
