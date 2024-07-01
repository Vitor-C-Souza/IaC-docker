module "Homologacao" {
    source = "../../infra" 

    nome = "homologacao"
    descricao = "aplicacao-de-homologacao"
    max = 3
    maquina = "t2.micro"
    ambiente = "ambiente-de-homologacao"
}