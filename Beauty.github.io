public class App {
    public class Main {
        import java.util.ArrayList;
    import java.util.List;
    import java.util.Scanner;
    
    class Usuario {
        private String nome;
        private String email;
    
        public Usuario(String nome, String email) {
            this.nome = nome;
            this.email = email;
        }
    
        @Override
        public String toString() {
            return "Usuário: " + nome + ", Email: " + email;
        }
    }
    
    class Produto {
        private String nome;
        private double preco;
        private String dataEntrega;
    
        public Produto(String nome, double preco, String dataEntrega) {
            this.nome = nome;
            this.preco = preco;
            this.dataEntrega = dataEntrega;
        }
    
        public double getPreco() {
            return preco;
        }
    
        @Override
        public String toString() {
            return "Produto: " + nome + ", Preço: R$" + preco + ", Data de Entrega: " + dataEntrega;
        }
    }
    
    class GestaoPlus {
        private List<Usuario> usuarios;
        private List<Produto> produtos;
    
        public GestaoPlus() {
            usuarios = new ArrayList<>();
            produtos = new ArrayList<>();
        }
    
        public void cadastrarUsuario(String nome, String email) {
            Usuario novoUsuario = new Usuario(nome, email);
            usuarios.add(novoUsuario);
            System.out.println("Usuário " + nome + " cadastrado com sucesso!");
        }
    
        public void cadastrarProduto(String nomeProduto, double preco, String dataEntrega) {
            Produto novoProduto = new Produto(nomeProduto, preco, dataEntrega);
            produtos.add(novoProduto);
            System.out.println("Produto " + nomeProduto + " cadastrado com sucesso!");
        }
    
        public void calcularValorTotal(String periodicidade) {
            double total = 0;
            for (Produto produto : produtos) {
                total += produto.getPreco();
            }
    
            if ("mensal".equalsIgnoreCase(periodicidade)) {
                System.out.printf("Valor total mensal: R$%.2f%n", total);
            } else if ("quinzenal".equalsIgnoreCase(periodicidade)) {
                System.out.printf("Valor total quinzenal: R$%.2f%n", total / 2);
            }
        }
    
        public void listarProdutos() {
            System.out.println("Produtos cadastrados:");
            for (Produto produto : produtos) {
                System.out.println(produto);
            }
        }
    }
    
    public class Main {
        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);
            GestaoPlus sistema = new GestaoPlus();
    
            // Cadastro do usuário
            System.out.print("Digite seu nome: ");
            String nome = scanner.nextLine();
            System.out.print("Digite seu email: ");
            String email = scanner.nextLine();
            sistema.cadastrarUsuario(nome, email);
    
            while (true) {
                System.out.println("\n--- Opções do Sistema Gestão Plus ---");
                System.out.println("1. Cadastrar Produto");
                System.out.println("2. Listar Produtos");
                System.out.println("3. Calcular Valor Total (Mensal)");
                System.out.println("4. Calcular Valor Total (Quinzenal)");
                System.out.println("5. Sair");
    
                System.out.print("Escolha uma opção: ");
                int opcao = scanner.nextInt();
                scanner.nextLine(); // Consumir nova linha
    
                if (opcao == 1) {
                    System.out.print("Nome do Produto: ");
                    String nomeProduto = scanner.nextLine();
                    System.out.print("Preço do Produto: ");
                    double preco = scanner.nextDouble();
                    scanner.nextLine(); // Consumir nova linha
                    System.out.print("Data de Entrega (dd/mm/yyyy): ");
                    String dataEntrega = scanner.nextLine();
                    sistema.cadastrarProduto(nomeProduto, preco, dataEntrega);
    
                } else if (opcao == 2) {
                    sistema.listarProdutos();
    
                } else if (opcao == 3) {
                    sistema.calcularValorTotal("mensal");
    
                } else if (opcao == 4) {
                    sistema.calcularValorTotal("quinzenal");
    
                } else if (opcao == 5) {
                    System.out.println("Saindo do sistema...");
                    break;
    
                } else {
                    System.out.println("Opção inválida. Tente novamente.");
                }
            }
    
            scanner.close();
        }
    }
    }
    
    }
}
