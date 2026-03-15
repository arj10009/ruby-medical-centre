#!/bin/bash
cd "$(dirname "$0")"
TOKEN="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"
git add -A
git commit -m "Link Book an Appointment button to HealthEngine"
git remote set-url origin "https://arj10009:${TOKEN}@github.com/arj10009/ruby-medical-centre.git"
git push origin main
echo "Updated! Changes will be live in about 30 seconds."
