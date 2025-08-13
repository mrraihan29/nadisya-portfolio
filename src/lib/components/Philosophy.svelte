<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';

	let sectionRef: HTMLElement;
	let titleRef: HTMLElement;
	let contentRef: HTMLElement;

	onMount(() => {
		gsap.registerPlugin(ScrollTrigger);

		// Create timeline for staggered animations
		const tl = gsap.timeline({
			scrollTrigger: {
				trigger: sectionRef,
				start: 'top 80%',
				toggleActions: 'play none none reverse'
			}
		});

		tl.fromTo(
			titleRef,
			{ y: 60, opacity: 0 },
			{ y: 0, opacity: 1, duration: 1.2, ease: 'power3.out' }
		).fromTo(
			'.philosophy-text',
			{ y: 40, opacity: 0 },
			{ y: 0, opacity: 1, duration: 1, ease: 'power2.out', stagger: 0.1 },
			'-=0.6'
		);
	});
</script>

<section bind:this={sectionRef} class="philosophy-section" id="philosophy">
	<div class="philosophy-container">
		<div class="section-header">
			<div class="section-number">03</div>
			<div class="section-info">
				<h2 bind:this={titleRef} class="section-title">ABOUT</h2>
			</div>
		</div>

		<div bind:this={contentRef} class="philosophy-content">
			<div class="philosophy-grid">
				<div class="philosophy-text">
					<h3>/ EMBRACING HERITAGE</h3>
					<p>
						Nadisya's artistic journey is deeply rooted in the cultural heritage of Indonesia. Born
						and raised in Jakarta, she brings a unique perspective that seamlessly blends
						traditional aesthetics with contemporary expression, creating pieces that are both
						timeless and avant-garde.
					</p>
					<p>
						This early exposure to the timeless elegance of Indonesian art forms laid the foundation
						for her aesthetic philosophy, one that honors these traditions, seamlessly blending
						classic techniques with a modern touch.
					</p>
				</div>

				<div class="philosophy-text">
					<h3>/ INNOVATIVE VISION</h3>
					<p>
						What sets Nadisya apart is her ability to merge the past with the present. Her artworks
						are a testament to the fusion of traditional motifs and contemporary ideas, reflecting
						her innovative approach to art.
					</p>
					<p>
						Nadisya's influence extends beyond exhibitions, as she continues to inspire new
						generations of artists. Her unwavering commitment and dedication to preserving and
						evolving Indonesian artistic traditions.
					</p>
				</div>
			</div>

			<div class="philosophy-quote">
				<blockquote class="philosophy-text">
					"In the intersection of tradition and innovation lies the potential to create art that
					transcends cultural boundaries—touching something deeply universal."
				</blockquote>
				<cite class="philosophy-author">— Nadisya</cite>
			</div>
		</div>
	</div>
</section>

<style>
	.philosophy-section {
		padding: var(--spacing-2xl) 0;
		background: var(--color-surface);
		position: relative;
	}

	.philosophy-container {
		max-width: var(--container-width);
		margin: 0 auto;
		padding: 0 2rem;
	}

	.section-header {
		display: flex;
		align-items: flex-start;
		gap: 3rem;
		margin-bottom: var(--spacing-xl);
		padding-bottom: 3rem;
		border-bottom: 1px solid var(--color-border);
	}

	.section-number {
		font-family: var(--font-sans);
		font-size: 1rem;
		font-weight: var(--font-weight-medium);
		color: var(--color-text-light);
		letter-spacing: 0.1em;
		flex-shrink: 0;
	}

	.section-info {
		flex: 1;
	}

	.section-title {
		font-family: var(--font-sans);
		font-size: clamp(3rem, 8vw, 8rem);
		font-weight: var(--font-weight-bold);
		line-height: 0.9;
		color: var(--color-text);
		text-transform: uppercase;
		letter-spacing: -0.02em;
	}

	.philosophy-content {
		max-width: 1000px;
	}

	.philosophy-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 4rem;
		margin-bottom: 6rem;
	}

	.philosophy-text h3 {
		font-family: var(--font-sans);
		font-size: 0.8rem;
		font-weight: var(--font-weight-semibold);
		letter-spacing: 0.1em;
		color: var(--color-text);
		margin-bottom: 1.5rem;
		text-transform: uppercase;
	}

	.philosophy-text p {
		font-family: var(--font-sans);
		font-size: 1rem;
		font-weight: var(--font-weight-light);
		line-height: 1.7;
		color: var(--color-text-muted);
		margin-bottom: 1.5rem;
	}

	.philosophy-quote {
		border-left: 2px solid var(--color-accent);
		padding-left: 3rem;
		max-width: 600px;
	}

	.philosophy-quote blockquote {
		font-family: var(--font-serif);
		font-size: 1.3rem;
		font-weight: var(--font-weight-light);
		line-height: 1.6;
		color: var(--color-text);
		margin-bottom: 2rem;
		font-style: italic;
	}

	.philosophy-author {
		font-family: var(--font-sans);
		font-size: 0.9rem;
		font-weight: var(--font-weight-medium);
		color: var(--color-text-light);
		letter-spacing: 0.05em;
	}

	/* Mobile responsive */
	@media (max-width: 1024px) {
		.section-header {
			flex-direction: column;
			gap: 1.5rem;
		}

		.philosophy-grid {
			grid-template-columns: 1fr;
			gap: 2.5rem;
		}

		.philosophy-quote {
			padding-left: 2rem;
		}
	}

	@media (max-width: 768px) {
		.philosophy-container {
			padding: 0 1rem;
		}

		.philosophy-quote blockquote {
			font-size: 1.1rem;
		}

		.section-title {
			font-size: 3rem;
		}
	}
</style>
