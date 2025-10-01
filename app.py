import streamlit as st

st.title("Olá Mundo!")

# Inicializa contador se não existir
if "contador" not in st.session_state:
    st.session_state.contador = 0

# Botão que incrementa o contador
if st.button("Clique aqui"):
    st.session_state.contador += 1

st.write(f"Você clicou {st.session_state.contador} vezes!")
