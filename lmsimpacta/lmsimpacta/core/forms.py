from django import forms
from django import forms
from django.contrib.auth.models import User
from core.models import *
from random import randint
import smtplib

'''Função para enviar email'''

def envia_email(email,ra,s):
    remetente    = 'rodolfolibona@gmail.com'
    senha        = '******'
    
    ''' Conteudo a ser enviado'''

    destinatario = email
    assunto      = 'Matricula em Fac. Impacta'
    texto        =  ("Parabens por se matricular! \n Segue seus dados para logar-se no site : \n Seu RA: {0} \n Senha {1} senha \n Para trocar a senha faça o login e entre em seu perfil".format(ra,s))

    '''Informação que o "admin" preencheria para mandar o email'''

    msg = '\r\n'.join([
    'From: %s' % remetente,
    'To: %s' % destinatario,
    'Subject: %s' % assunto,    '',    
    
    "{}".format(texto)   ])
 
    '''Envia o email'''
    server = smtplib.SMTP('smtp.gmail.com')
    server.starttls()
    server.login(remetente,senha)
    server.sendmail(remetente, destinatario, msg)


class MatriculaForm(forms.ModelForm):

    class Meta:
        model = Matricula
        fields = "__all__"

class QuestaoForm(forms.ModelForm):

    class Meta:
        model = Questao
        exclude = ["turma"]

class AlunoForm(forms.ModelForm):

    class Meta:
        model = Aluno
        exclude = ["perfil","last_login","password","ativo","ra"]

    def save(self, commit=True):
        user = super(AlunoForm, self).save(commit=False)
        user.set_password('aluno@univands')
        user.perfil = 'A'
        user.ra = randint(100000,199999)
        if commit:
            user.save()
            
            envia_email(user.email,user.ra,s=('aluno@univands'))  
        return user      

'''class FotoForm(forms.ModelForm):

    class Meta:
        model = Foto
        fields = "__all__"


        '''
    

