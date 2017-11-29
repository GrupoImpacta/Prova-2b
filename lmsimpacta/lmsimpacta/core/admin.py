from django.contrib import admin
from core.models import *
from django.contrib.auth.admin import UserAdmin
from django import forms
from random import randint
from django.core.mail import send_mail
import smtplib

'''Tabelas aluno e na criação do aluno envia o email(esse email é somente pelo admin)'''

def testara_Aluno(n):
    lista = []
    contexto = Usuario.objects.all()
    for x in contexto:
        lista.append(x.ra)
    while n in lista:
        n = randint(100000,199999)
    return n


def envia_email(email,ra,s):
    remetente    = 'rodolfolibona@gmail.com'
    senha        = '*****'
    
    '''Conteudo do email'''
    
    destinatario = email
    assunto      = 'Matricula em Univans'
    texto        =  ("Parabens por se matricular! \n Segue seus dados para logar-se no site : \n Seu RA: {0} \n Senha {1} senha \n Para trocar a senha faça o login e entre em seu perfil".format(ra,s))

    '''Preenche os campos necessarios para enviar email'''

    msg = '\r\n'.join([
    'From: %s' % remetente,
    'To: %s' % destinatario,
    'Subject: %s' % assunto,    '',    
    
    "{}".format(texto)   ])
 
    ''' Envia o email'''
    server = smtplib.SMTP('smtp.gmail.com')
    server.starttls()
    server.login(remetente,senha)
    server.sendmail(remetente, destinatario, msg)
    
class NovoAlunoForm(forms.ModelForm):
    class Meta:
        model = Aluno
        fields = ('email','turma', 'nome', 'celular')

    def save(self, commit=True):
        user = super(NovoAlunoForm, self).save(commit=False)
        user.set_password('aluno@univands')
        user.perfil = 'A'
        n = randint(100000,199999)
        ra_unico = testara_Aluno(n)
        user.ra = ra_unico
        s = 'aluno@univands'
        email = user.email

        envia_email(email,ra_unico,s)      
        if commit:
            envia_email(email,ra_unico,s)  
            print(a)
            user.save()
            
            
        return user

class AlterarAlunoForm(forms.ModelForm):
    class Meta:
        model = Aluno
        fields = ('email','turma', 'nome','celular')
        
class AlunoAdmin(UserAdmin):
    form = AlterarAlunoForm
    add_form = NovoAlunoForm


class AlunoAdmin(UserAdmin):
    form = AlterarAlunoForm
    add_form = NovoAlunoForm
    list_display = ('ra', 'nome', 'turma')
    list_filter = ('perfil',)
    fieldsets = ( (None, {'fields': ('email','turma', 'nome','celular')}),)
    add_fieldsets = (
        (None, {
            'fields': ('email','turma', 'nome', 'celular')

            } ),
             
         )
    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()

'''Tabelas Professor no admin'''

def testara_Professor(n):
    lista = []
    contexto = Usuario.objects.all()
    for x in contexto:
        lista.append(x.ra)
    while n in lista:
        n = randint(100000,199999)
    return n   

class NovoProfessorForm(forms.ModelForm):
    class Meta:
        model = Professor
        fields = ('ra','email', 'nome','apelido')

    def save(self, commit=True):
        user = super(NovoProfessorForm, self).save(commit=False)
        user.set_password('prof@univands')
        user.perfil = 'P'
        n = randint(100000,199999)
        ra_unico = testara_Professor(n)
        user.ra = ra_unico        
        if commit:
            user.save()
        return user

class AlterarProfessorForm(forms.ModelForm):
    class Meta:
        model = Professor
        fields = ('email', 'nome', 'apelido')
        
class ProfessorAdmin(UserAdmin):
    form = AlterarProfessorForm
    add_form = NovoProfessorForm


class ProfessorAdmin(UserAdmin):
    form = AlterarProfessorForm
    add_form = NovoProfessorForm
    list_display = ('ra', 'nome','apelido')
    list_filter = ('perfil',)
    fieldsets = ( (None, {'fields': ('email', 'nome','apelido')}),)
    add_fieldsets = (
        (None, {
            'fields': ( 'email', 'nome','apelido')

            } ),
             
         )
    search_fields = ('email',)
    ordering = ('nome',)
    filter_horizontal = ()    

'''Tabela Curso no admin'''
class CursoAdmin(admin.ModelAdmin):

    list_display = ('sigla', 'nome')
    list_filter = ('nome',) 
    fieldsets = ( (None, {'fields': ('sigla', 'nome')  }),)
    add_fieldsets = (
        (None, {
            'fields':('sigla', 'nome')

            } ),
             
         )
    search_fields = ('sigla', 'nome')
    ordering = ('nome',)
    filter_horizontal = () 

'''Tabela GradeCurricular no admin'''

class GradeCurricularAdmin(admin.ModelAdmin):
    list_display = ('ano','semestre','curso' ) 
    list_filter = ('ano','semestre','curso' )  
    fieldsets = ( (None, {'fields': ('ano','semestre','curso' )  }),)
    add_fieldsets = (
        (None, {
            'fields':('ano','semestre','curso' )  

            } ),
             
         )
    search_fields = ('ano','semestre','curso', ) 
    ordering = ('ano',)
    filter_horizontal = () 

'''Tabela Periodo no admin'''

class PeriodoAdmin(admin.ModelAdmin):
    list_display = ('numero','gradeCurricular')
    list_filter = ('numero','gradeCurricular')
    fieldsets = ( (None, {'fields': ('numero','gradeCurricular')}),)
    add_fieldsets = (
        (None, {
            'fields': ('numero','gradeCurricular')

            } ),
             
         )
    search_fields = ('numero','gradeCurricular')
    ordering = ('numero',)
    filter_horizontal = ()
    
'''Tabela DisciplinaOfertada no admin'''

class DisciplinaOfertadaAdmin(admin.ModelAdmin):
    list_display = ('ano','semestre','disciplina')
    list_filter = ('ano','semestre','disciplina')
    fieldsets = ( (None, {'fields': ('ano','semestre','disciplina')}),)
    add_fieldsets = (
        (None, {
            'fields':('ano','semestre','disciplina')

            } ),
             
         )
    search_fields = ('ano','semestre','disciplina')
    ordering = ('ano',)
    filter_horizontal = ()

'''Tabela Disciplina no admin'''

class DisciplinaAdmin(admin.ModelAdmin):
    #form = AlterarDisciplinaForm
    #add_form = NovoDisciplinaForm 
    list_display = ('nome','carga_horaria')
    list_filter = ('nome','carga_horaria')
    fieldsets = ( (None, {'fields': ('nome','carga_horaria','teoria','pratica','ementa','competencias','habilidades','conteudo','bibliografia_complementar','bibliografia_basica')}),)
    add_fieldsets = (
        (None, {
            'fields':('nome','carga_horaria','teoria','pratica','ementa','competencias','habilidades','conteudo','bibliografia_complementar','bibliografia_basica')

            } ),
             
         )
    search_fields = ('nome','carga_horaria')
    ordering = ('nome',)
    filter_horizontal = ()

'''Tabela Turma no admin'''

class TurmaAdmin(admin.ModelAdmin):

    list_display = ('turma_sigla','professor','turno','disciplinaOfertadas')
    list_filter = ('turma_sigla','professor','turno')
    fieldsets = ( (None, {'fields': ('disciplinaOfertadas','turma_sigla','professor','turno','cursos')}),)
    add_fieldsets = (
        (None, {
            'fields':('disciplinaOfertadas','turma_sigla','professor','turno','cursos')

            } ),
             
         )
    search_fields = ('disciplinaOfertadas','turma_sigla','professor','turno','cursos')
    ordering = ('turma_sigla',)
    filter_horizontal = ()

'''Tabela Matricula no admin'''

class MatriculaAdmin(admin.ModelAdmin):
    list_display = ('ra', 'turma', 'disciplina', 'ano','semestre',)
    list_filter =('turma', 'disciplina', 'ano','semestre',)
    fieldsets = ( (None, {'fields': ('ra', 'turma', 'disciplina', 'ano','semestre',)}),)
    add_fieldsets = (
        (None, {
            'fields':('ra', 'turma', 'disciplina', 'ano','semestre',)

            } ),
             
         )
    search_fields = ('ra',)
    ordering = ('disciplina',)
    filter_horizontal = ()



'''Coloca as tabelas do banco para o admin brincar com elas'''

admin.site.register(Aluno,AlunoAdmin)
admin.site.register(Professor,ProfessorAdmin)
admin.site.register(Curso,CursoAdmin)
admin.site.register(Matricula,MatriculaAdmin)
admin.site.register(Disciplina,DisciplinaAdmin)
admin.site.register(Periodo,PeriodoAdmin)
admin.site.register(Turma,TurmaAdmin)
admin.site.register(GradeCurricular,GradeCurricularAdmin)
admin.site.register(DisciplinaOfertada,DisciplinaOfertadaAdmin)

