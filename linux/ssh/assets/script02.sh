echo "Aqui estamos no computador local '$( hostname )'."

CMD_SSH="$( cat <<'EOF'
echo "Agora estamos no computador remoto '$( hostname )'."
for i in {1..5}; do
  date;
  sleep 1;
done
EOF
)"

ssh node01 "$CMD_SSH"

echo "E voltamos para o computador local '$( hostname )' de novo."
