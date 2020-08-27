from django import forms

class ConsultaForm(forms.Form):
    nombre = forms.CharField(label="Nombre")
    correo = forms.EmailField(label="Correo", required=True)

