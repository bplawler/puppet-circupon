#!/bin/bash

echo "db.members.update({}, {$unset: {currentPircularStatus: 1}}, false, true" | mongo circupondb
