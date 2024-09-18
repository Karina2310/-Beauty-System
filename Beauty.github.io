import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

// Definição das classes Cliente, Produto, Servico e Profissional
class Cliente {
    private String nome;
    private String telefone;

<applet code="HelloWorld.class" width="300" height="300">
        Seu navegador não suporta Applets.
    </applet>

    public Cliente(String nome, String telefone) {https://github.com/Karina2310/-Beauty-System/tree/main
        this.nome = nome;
        this.telefone = telefone;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + ", Telefone: " + telefone;
    }
}

class Produto {
    private String nome;
    private double preco;

    public Produto(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    @Override
    public String toString() {
        return "Produto: " + nome + ", Preço: R$ " + preco;
    }
}

class Servico {
    private String nome;
    private double preco;

    public Servico(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    @Override
    public String toString() {
        return "Serviço: " + nome + ", Preço: R$ " + preco;
    }
}

class Profissional {
    private String nome;
    private String especialidade;

    public Profissional(String nome, String especialidade) {
        this.nome = nome;
        this.especialidade = especialidade;
    }

    @Override
    public String toString() {
        return "Profissional: " + nome + ", Especialidade: " + especialidade;
    }
}

public class Main {

    static ArrayList<Cliente> clientes = new ArrayList<>();
    static ArrayList<Produto> produtos = new ArrayList<>();
    static ArrayList<Servico> servicos = new ArrayList<>();
    static ArrayList<Profissional> profissionais = new ArrayList<>();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Login básico
        if (!login(scanner)) {
            System.out.println("Login ou senha incorretos.");
            scanner.close();
            return;
        }

        // Menu principal
        int opcao;
        do {
            System.out.println("\n--- Menu Principal ---");
            System.out.println("1. Cadastrar Cliente");
            System.out.println("2. Cadastrar Produto");
            System.out.println("3. Cadastrar Serviço");
            System.out.println("4. Cadastrar Profissional");
            System.out.println("5. Listar Cadastros");
            System.out.println("6. Sair");
            System.out.print("Escolha uma opção: ");
            
            try {
                opcao = scanner.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("Opção inválida. Tente novamente.");
                scanner.nextLine(); // Limpar o buffer
                continue;
            }
            scanner.nextLine(); // Consumir a nova linha

            switch (opcao) {
                case 1:
                    cadastrarCliente(scanner);
                    break;
                case 2:
                    cadastrarProduto(scanner);
                    break;
                case 3:
                    cadastrarServico(scanner);
                    break;
                case 4:
                    cadastrarProfissional(scanner);
                    break;
                case 5:
                    listarCadastros();
                    break;
                case 6:
                    System.out.println("Saindo...");
                    break;
                default:
                    System.out.println("Opção inválida. Tente novamente.");
            }
        } while (opcao != 6);

        scanner.close();
    }

    // Método de login simples
    public static boolean login(Scanner scanner) {
        System.out.print("Digite o login: ");
        String login = scanner.nextLine();
        System.out.print("Digite a senha: ");
        String senha = scanner.nextLine();

        return login.equals("admin") && senha.equals("12345");
    }

    // Cadastro de cliente
    public static void cadastrarCliente(Scanner scanner) {
        System.out.print("Digite o nome do cliente: ");
        String nome = scanner.nextLine();
        System.out.print("Digite o telefone do cliente: ");
        String telefone = scanner.nextLine();
        clientes.add(new Cliente(nome, telefone));
        System.out.println("Cliente cadastrado com sucesso!");
    }

    // Cadastro de produto
    public static void cadastrarProduto(Scanner scanner) {
        System.out.print("Digite o nome do produto: ");
        String nome = scanner.nextLine();
        System.out.print("Digite o preço do produto: ");
        double preco;
        try {
            preco = scanner.nextDouble();
        } catch (InputMismatchException e) {
            System.out.println("Preço inválido. Tente novamente.");
            scanner.nextLine(); // Limpar o buffer
            return;
        }
        scanner.nextLine(); // Consumir a nova linha
        produtos.add(new Produto(nome, preco));
        System.out.println("Produto cadastrado com sucesso!");
    }

    // Cadastro de serviço
    public static void cadastrarServico(Scanner scanner) {
        System.out.print("Digite o nome do serviço: ");
        String nome = scanner.nextLine();
        System.out.print("Digite o preço do serviço: ");
        double preco;
        try {
            preco = scanner.nextDouble();
        } catch (InputMismatchException e) {
            System.out.println("Preço inválido. Tente novamente.");
            scanner.nextLine(); // Limpar o buffer
            return;
        }
        scanner.nextLine(); // Consumir a nova linha
        servicos.add(new Servico(nome, preco));
        System.out.println("Serviço cadastrado com sucesso!");
    }

    // Cadastro de profissional
    public static void cadastrarProfissional(Scanner scanner) {
        System.out.print("Digite o nome do profissional: ");
        String nome = scanner.nextLine();
        System.out.print("Digite a especialidade do profissional: ");
        String especialidade = scanner.nextLine();
        profissionais.add(new Profissional(nome, especialidade));
        System.out.println("Profissional cadastrado com sucesso!");
    }

    // Listar todos os cadastros
    public static void listarCadastros() {
        System.out.println("\n--- Clientes Cadastrados ---");
        for (Cliente cliente : clientes) {
            System.out.println(cliente);
        }

        System.out.println("\n--- Produtos Cadastrados ---");
        for (Produto produto : produtos) {
            System.out.println(produto);
        }

        System.out.println("\n--- Serviços Cadastrados ---");
        for (Servico servico : servicos) {
            System.out.println(servico);
        }

        System.out.println("\n--- Profissionais Cadastrados ---");
        for (Profissional profissional : profissionais) {
            System.out.println(profissional);
        }
    }
}
