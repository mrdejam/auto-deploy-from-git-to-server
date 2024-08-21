#!/bin/bash

# اطلاعات دسترسی به گیت
GIT_USERNAME="mrdejam"
GIT_PASSWORD="your_github_key"

# کشیدن آخرین تغییرات از مخزن گیت
echo "در حال کشیدن آخرین تغییرات از مخزن گیت..."
git pull https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/mrdejam/test-project.git

# بررسی موفقیت‌آمیز بودن کشیدن تغییرات از گیت
if [ $? -eq 0 ]; then
  echo "کشیدن تغییرات از گیت موفقیت‌آمیز بود. ادامه به ساخت پروژه..."

  # ساخت پروژه
  npm run build

  # بررسی موفقیت‌آمیز بودن ساخت پروژه
  if [ $? -eq 0 ]; then
    echo "ساخت پروژه موفقیت‌آمیز بود. در حال شروع پروژه..."
    npm run start
  else
    echo "ساخت پروژه ناموفق بود. لطفاً خطاهای ساخت را بررسی کنید."
  fi
else
  echo "کشیدن تغییرات از گیت ناموفق بود. لطفاً خطاهای گیت را بررسی کنید."
fi
