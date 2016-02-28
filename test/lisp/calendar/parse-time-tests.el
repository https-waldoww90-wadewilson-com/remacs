;; parse-time-tests.el --- Test suite for parse-time.el

;; Copyright (C) 2016 Free Software Foundation, Inc.

;; Author: Lars Ingebrigtsen <larsi@gnus.org>

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'ert)
(require 'parse-time)

(ert-deftest parse-time-tests ()
  (should (equal (parse-time-string "Mon, 22 Feb 2016 19:35:42 +0100")
                 '(42 35 19 22 2 2016 1 nil 3600)))
  (should (equal (parse-time-string "22 Feb 2016 19:35:42 +0100")
                 '(42 35 19 22 2 2016 nil nil 3600)))
  (should (equal (parse-time-string "22 Feb 2016 +0100")
                 '(nil nil nil 22 2 2016 nil nil 3600)))
  (should (equal (parse-time-string "Mon, 22 Feb 16 19:35:42 +0100")
                 '(42 35 19 22 2 2016 1 nil 3600)))
  (should (equal (parse-time-string "Mon, 22 February 2016 19:35:42 +0100")
                 '(42 35 19 22 2 2016 1 nil 3600)))
  (should (equal (parse-time-string "Mon, 22 feb 2016 19:35:42 +0100")
                 '(42 35 19 22 2 2016 1 nil 3600)))
  (should (equal (parse-time-string "Monday, 22 february 2016 19:35:42 +0100")
                 '(42 35 19 22 2 2016 1 nil 3600)))
  (should (equal (parse-time-string "Monday, 22 february 2016 19:35:42 PDT")
                 '(42 35 19 22 2 2016 1 t -25200)))

  (should (equal (parse-iso8601-time-string "2016-02-28T15:28:09+1030")
                 '(22226 32353))))

(provide 'parse-time-tests)

;;; parse-time-tests.el ends here
