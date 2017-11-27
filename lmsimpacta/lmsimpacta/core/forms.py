from django import forms

from core.models import Curso, Questao

class CursoForm(forms.ModelForm):

    class Meta:
        model = Curso
        fields = "__all__"

class ContatoForm(forms.Form):

    nome = forms.CharField()
    email = forms.EmailField()
    mensagem = forms.CharField()

    def envia_email(self):
        print(
            "Email Para você:\n"+
            "Aluno: "+self.cleaned_data["nome"]+"\n"+
            "Email: "+self.cleaned_data["email"]+"\n"+
            "Mensagem: "+self.cleaned_data["mensagem"]
        )

class QuestaoForm(forms.ModelForm):

    class Meta:
        model = Questao
        exclude = ["curso"]



class AlunoForm(forms.Form):

    nome = forms.CharField()
    email = forms.EmailField()
    ra = forms.CharField()